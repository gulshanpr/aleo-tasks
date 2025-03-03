### `check_if_big_num_privately.aleo`

---

#### **Short Description:**
This program allows users to store a number privately on the blockchain. Other users can check if their guessed number is smaller than the stored number without revealing the actual stored number. This ensures privacy while enabling verification.

---

#### **How It Works:**
1. **Store a Number Privately**:
   - A user can store a number privately by calling the `store_number` transition.
   - The number is stored in a `Store` struct along with the user's address and a unique `id`.

2. **Check if a Number is Smaller**:
   - Another user can call the `is_bigger` transition to check if their guessed number is smaller than the stored number.
   - The program verifies the guess without revealing the actual stored number.

---

#### **Key Features:**
- **Privacy**: The stored number is kept private and is not revealed during verification.
- **Verification**: Users can verify if their guessed number is smaller than the stored number.
- **Immutable Storage**: The stored number is saved in a mapping on the blockchain, ensuring transparency and immutability.

---

#### **Program Structure:**
1. **Structs**:
   - `Store`: Contains the `id`, `user` address, and `number`.

2. **Mappings**:
   - `stores`: Maps a unique `id` to a `Store` struct.

3. **Transitions**:
   - `store_number`: Allows a user to store a number privately.
   - `is_bigger`: Allows a user to check if their guessed number is smaller than the stored number.

4. **Functions**:
   - `f_store_number`: Helper function to store the number in the mapping.
   - `f_is_bigger`: Helper function to verify if the guessed number is smaller than the stored number.

---

#### **Usage Example:**

1. **Store a Number**:
   - Alice stores her number `42` with a unique `id`:
     ```leo
     store_number(Store { id: 123field, user: aleo1alice123, number: 42u32 }, 123field);
     ```

2. **Check if a Number is Smaller**:
   - Bob wants to check if his guessed number `30` is smaller than Alice's stored number:
     ```leo
     is_bigger(123field, 30u32);
     ```
   - If Alice's stored number is `42`, the program will confirm that `30` is smaller.

---

#### **Requirements:**
- Aleo CLI installed.
- Basic understanding of Leo programming.


This program is a simple yet powerful example of how privacy-preserving computations can be implemented on the blockchain using Aleo and Leo.