program auction_test_1.aleo {

    record Bid {
        owner: address,
        bidder: address,
        amount: u64,
        is_winner: bool,
    }

    transition place_bid(bidder: address, amount: u64) -> Bid {

        assert_eq(self.caller, bidder);

        return Bid {
            owner: aleo1jf252npmem3a9suskv3km8msvhcagg523qv69xle5splnlcy0sxqlalkrf,
            bidder: bidder,
            amount: amount,
            is_winner: false,
        };
    }

    transition resolve(first: Bid, second: Bid) -> Bid {

        assert_eq(self.caller, aleo1jf252npmem3a9suskv3km8msvhcagg523qv69xle5splnlcy0sxqlalkrf);

        if (first.amount >= second.amount) {
            return first;
        } else {
            return second;
        }
    }

    transition finish(bid: Bid) -> Bid {

        assert_eq(self.caller, aleo1jf252npmem3a9suskv3km8msvhcagg523qv69xle5splnlcy0sxqlalkrf);

        return Bid {
            owner: bid.bidder,
            bidder: bid.bidder,
            amount: bid.amount,
            is_winner: true,
        };
    }
}