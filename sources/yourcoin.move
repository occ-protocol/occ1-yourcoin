// OCC-1: Object-Centric Coin Protocol v1 (Move)
// Designed by SongYeongEng - for cross-game, object-native currency on Sui

module occ1::yourcoin {
    use sui::object::{UID, ID};
    use sui::tx_context::TxContext;
    use sui::transfer;
    use sui::vector;
    use sui::string;

    /// The base object-centric coin
    struct YourCoin has key {
        id: UID,
        spent: bool,
        history: vector<String>,
    }

    /// Mint a new YourCoin to a recipient
    public fun mint(recipient: address, ctx: &mut TxContext): YourCoin {
        let uid = object::new(ctx);
        let history = vector::empty<String>();
        let coin = YourCoin {
            id: uid,
            spent: false,
            history
        };
        transfer::transfer(coin, recipient);
        coin
    }

    /// Spend the coin and log usage context
    public fun spend(coin: &mut YourCoin, action: String) {
        assert!(!coin.spent, 0);
        coin.spent = true;
        vector::push_back(&mut coin.history, action);
    }

    /// Check if a coin is still valid (not spent)
    public fun is_valid(coin: &YourCoin): bool {
        !coin.spent
    }

    /// Burn the coin completely (if desired)
    public fun burn(coin: YourCoin, _ctx: &mut TxContext) {
        // Consumes the object implicitly
    }
} 
