module todolist::todolist {

    use std::string::String;
    use sui::object;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    public struct TodoList has key, store {
        id: UID,
        items: vector<String>,
    }

    public fun new(ctx: &mut TxContext) {
        let list = TodoList {
            id: object::new(ctx),
            items: vector[],
        };

        transfer::transfer(list, tx_context::sender(ctx));
    }
}
