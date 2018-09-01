//
//  Instantiatable.swift
//  MercariKit
//
//  Created by tarunon on 2018/04/02.
//  Copyright © 2018 Mercari. All rights reserved.
//

/// The base protocol that all ViewControllers (and ViewModels) should conform to.
/// The protocol enforces that they have access to an Environment and an Input which are required for communicating between the different layers of the app.
///
/// ## associatedtype Input
/// `Input` should be a "value type" such as `struct` or `enum`.
/// It is recommended to define `Input` for each `Instantiatable` class.
///
/// `Input` can be shared with `Injectable.Input`.
///
/// If you want to implement completion handlers, please use `Interactable` instead.
///
/// ## associatedtype Environtment
/// `Environment` is a dependency resolver.
public protocol Instantiatable {
    associatedtype Input
    init(with input: Input)
}

public extension Instantiatable {
    public static func instantiate(_ input: Input) -> Self {
        return Self.init(with: input)
    }
}

public extension Instantiatable where Input == Void {
    public static func instantiate() -> Self {
        return Self.init(with: ())
    }
}
