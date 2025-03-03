program check_if_big_num_privately.aleo {
    struct Store {
        id: field,
        user: address,
        number: u32
    }

    mapping stores: field => Store;

    async transition store_number(store: Store, id: field) -> (Store, Future) {
        assert(store.number >= 0u32);
        return (
            store,
            f_store_number(
                id,
                store.number,
                self.caller
            )
        );
    }

    async function f_store_number(id: field, number: u32, caller: address) {
        stores.set(id, Store {
            id: id,
            user: caller,
            number: number
        });
    }

    async transition is_bigger(id: field, number: u32) -> (Future) {
        assert(number >= 0u32);
        
        return (
            f_is_bigger(
                id,
                number
            )
        );
    }

    async function f_is_bigger(id: field, number: u32) {
        let store: Store = stores.get(id);
        assert(store.number > number);
    }

}