# OCC-1: Object-Centric Coin Protocol v1 (Move)

**YourCoin** is the first implementation of **OCC-1** — a minimal, object-centric currency standard for games and cross-world value on the Sui blockchain, written in Move.

> Think ERC-20, but for on-chain objects — verifiable, ownable, and traceable.

---

## 🚀 Features
- ✅ Object-based coin (each coin is a Sui object)
- 🔄 Spendable with usage logging
- 🔍 `is_valid()` for fast coin verification
- 🧠 Optional `history[]` field for tracking usage context (e.g. game events)
- 🔗 Cross-game ready, composable, and developer-friendly

---

## 🧱 Module: `occ1::yourcoin`

### Struct Definition
```move
struct YourCoin has key {
    id: UID,
    spent: bool,
    history: vector<String>,
}
```

---

## 🔧 Core Functions

### `mint(recipient: address, ctx: &mut TxContext): YourCoin`
Creates a new object coin and transfers it to a recipient.

### `spend(coin: &mut YourCoin, action: String)`
Marks the coin as spent and logs an action into its history vector.

### `is_valid(coin: &YourCoin): bool`
Returns true if the coin has not been spent.

### `burn(coin: YourCoin, ctx: &mut TxContext)`
Destroys the coin (optional cleanup logic).

---

## 🧠 Example Integration
```move
if yourcoin::is_valid(&coin) {
    yourcoin::spend(&mut coin, "UsedAtBossGate");
}
```

Use `YourCoin` as a gate token, consumable entry item, quest currency, or meta-game memory stamp.

---

## 📦 Installation
1. Add the `yourcoin.move` module to your Sui Move package under `sources/`.
2. Add a dependency to `Move.toml` if needed.
3. Import and use like this:
```move
use occ1::yourcoin;
```

---

## 🔗 Protocol Info
- **Protocol**: OCC-1
- **Author**: [SongYeongEng](https://github.com/SongYeongEng)
- **Status**: Public, v1
- **Chain**: Sui
- **Language**: Move
- **Use Case**: Game currency, proof of participation, on-chain item memory

---

## 👾 Built at Sui HackerHouse 2025
You’re using the standard. You're using yourcoin.

> Own yourcoin. Own the moment. On-chain forever.
