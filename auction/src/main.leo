program auction_test_gulshan_2.aleo {

    record Bid {
        owner: address,
        bidder: address,
        amount: u64,
        is_winner: bool,
    }

    transition place_bid(bidder: address, amount: u64) -> Bid {

        assert_eq(self.caller, bidder);

        return Bid {
            owner: aleo12dhxfyemtryqkmz29mqvrazsrqhy9jha52wdnjwd55ext2rtgvrqcjkcjh,
            bidder: bidder,
            amount: amount,
            is_winner: false,
        };
    }

    transition resolve(first: Bid, second: Bid) -> Bid {

        assert_eq(self.caller, aleo12dhxfyemtryqkmz29mqvrazsrqhy9jha52wdnjwd55ext2rtgvrqcjkcjh);

        if (first.amount >= second.amount) {
            return first;
        } else {
            return second;
        }
    }

    transition finish(bid: Bid) -> Bid {

        assert_eq(self.caller, aleo12dhxfyemtryqkmz29mqvrazsrqhy9jha52wdnjwd55ext2rtgvrqcjkcjh);

        return Bid {
            owner: bid.bidder,
            bidder: bid.bidder,
            amount: bid.amount,
            is_winner: true,
        };
    }
}