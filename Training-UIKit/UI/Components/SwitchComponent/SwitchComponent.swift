//
//  SwitchComponent.swift
//  Training-UIKit
//
//  Created by Andras Olah on 2025. 12. 26..
//
import UIKit

final class LabeledAdaptiveSelectorView: UIView {

    struct Option: Equatable {
        let id: String
        let title: String
    }

    // Public UI
    let titleLabel = UILabel()

    // Callbacks
    var onChanged: ((Option) -> Void)?

    // Config
    private let threshold: Int

    // State
    private var options: [Option] = []
    private var selected: Option?

    // UI
    private let stackView = UIStackView()
    private let segmented = UISegmentedControl()
    private let dropdownButton = UIButton(type: .system)

    init(title: String, threshold: Int = 3) {
        self.threshold = threshold
        super.init(frame: .zero)
        configure(title: title)
    }

    required init?(coder: NSCoder) {
        self.threshold = 3
        super.init(coder: coder)
        configure(title: "")
    }

    // MARK: - Public API

    func setTitle(_ title: String) {
        titleLabel.text = title
    }

    func setOptions(_ options: [Option], selectedId: String? = nil) {
        self.options = options

        let initial = selectedId.flatMap { id in options.first(where: { $0.id == id }) }
        let fallback = options.first
        self.selected = initial ?? selected ?? fallback

        rebuildControl()
        applySelectionUI()
    }

    func setSelected(id: String) {
        guard let opt = options.first(where: { $0.id == id }) else { return }
        selected = opt
        applySelectionUI()
    }

    func getSelected() -> Option? { selected }

    // MARK: - Setup

    private func configure(title: String) {
        // Label
        titleLabel.text = title
        titleLabel.numberOfLines = 1
        titleLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        titleLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)

        // Segmented
        segmented.addTarget(self, action: #selector(segmentedChanged), for: .valueChanged)
        segmented.setContentHuggingPriority(.required, for: .horizontal)
        segmented.setContentCompressionResistancePriority(.required, for: .horizontal)

        // Dropdown button (menu)
        dropdownButton.configuration = .plain()
        dropdownButton.contentHorizontalAlignment = .trailing
        dropdownButton.setContentHuggingPriority(.required, for: .horizontal)
        dropdownButton.setContentCompressionResistancePriority(.required, for: .horizontal)
        if #available(iOS 15.0, *) {
            dropdownButton.configuration?.image = UIImage(systemName: "chevron.down")
            dropdownButton.configuration?.imagePlacement = .trailing
            dropdownButton.configuration?.imagePadding = 8
        } else {
            dropdownButton.setTitle("Select", for: .normal)
        }
        dropdownButton.showsMenuAsPrimaryAction = true // tap shows dropdown

        // Stack
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        // Start with label only; control is added by setOptions()
        stackView.addArrangedSubview(titleLabel)
    }

    private func rebuildControl() {
        // remove existing control if any
        if segmented.superview != nil { segmented.removeFromSuperview() }
        if dropdownButton.superview != nil { dropdownButton.removeFromSuperview() }

        // add correct control
        if options.count <= threshold {
            buildSegmented()
            stackView.addArrangedSubview(segmented)
        } else {
            buildMenuButton()
            stackView.addArrangedSubview(dropdownButton)
        }
    }

    private func buildSegmented() {
        segmented.removeAllSegments()
        for (idx, opt) in options.enumerated() {
            segmented.insertSegment(withTitle: opt.title, at: idx, animated: false)
        }
        if let selected, let idx = options.firstIndex(of: selected) {
            segmented.selectedSegmentIndex = idx
        } else {
            segmented.selectedSegmentIndex = UISegmentedControl.noSegment
        }
    }

    private func buildMenuButton() {
        let actions: [UIAction] = options.map { opt in
            UIAction(
                title: opt.title,
                state: (opt == selected ? .on : .off)
            ) { [weak self] _ in
                self?.select(opt)
            }
        }

        let menu = UIMenu(title: "", options: [.displayInline], children: actions)
        dropdownButton.menu = menu
    }

    private func applySelectionUI() {
        if options.count <= threshold {
            if let selected, let idx = options.firstIndex(of: selected) {
                segmented.selectedSegmentIndex = idx
            } else {
                segmented.selectedSegmentIndex = UISegmentedControl.noSegment
            }
        } else {
            // Update button title + menu checkmark states
            let title = selected?.title ?? "Select"
            if #available(iOS 15.0, *) {
                dropdownButton.configuration?.title = title
            } else {
                dropdownButton.setTitle(title, for: .normal)
            }
            buildMenuButton()
        }
    }

    private func select(_ option: Option) {
        selected = option
        applySelectionUI()
        onChanged?(option)
    }

    @objc private func segmentedChanged() {
        let idx = segmented.selectedSegmentIndex
        guard idx >= 0, idx < options.count else { return }
        select(options[idx])
    }
}
