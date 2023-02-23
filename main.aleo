// The 'nft.aleo' program.
program nft.aleo;

record nft:
    owner as address.private;
    gates as u64.private;
    symbol as u128.private; 
    ipfs_link as u128.private; 

interface nft_data:
    value1 as u128; 

mapping nft_amount:
    key data as field.public;
    value amount as u8.public;

mapping nft_owner_map:
    key address as address.public;
    value amount as u128.public;

function initialize:
    input r0 as u128.private;
    input r1 as u128.private;

    // Safety check on owner
    assert.eq self.caller aleo1y9dfsajfkew213432dsad431543d432dst43gdfwt43gfdshy54uj7fd;

    cast r0 r1 into r2 as nft_data;
    hash.bhp256 r2 into r3;

    finalize r3;

finalize initialize:
    input r0 as field.public;

    increment nft_amount[r0] by 1u8;

function mint:
    input r0 as address.private;
    input r1 as u128.private;
    input r2 as u128.private;
    
    cast r0 0u64 87631543154326543654387658987576536432u128 r1 r2 into r3 as nft.record; 

    cast r1 r2 into r4 as nft_data;
    hash.bhp256 r4 into r5;

    output r3 as nft.record;

    finalize r5;

finalize mint:
    input r0 as field.public;

    decrement nft_amount[r0] by 1u8;

function transfer_private:
    input r0 as nft.record;
    input r1 as address.private;

    assert.eq r0.owner self.caller; 

    cast r1 r0.gates 87631543154326543654387658987576536432u128 r0.ipfs_link into r2 as nft.record;

    output r2 as nft.record;


function convert_private_to_public:
    input r0 as nft.record;

    assert.eq r0.owner self.caller; 

    finalize r0.owner r0.ipfs_link;

finalize convert_private_to_public:
    input r0 as address.public;
    input r1 as u128.public;

    increment nft_owner_map[r0] by r1;

function convert_public_to_private:
    input r0 as u128.private;
    input r1 as u128.private;

    cast self.caller 0u64 87631543154326543654387658987576536432u128 r0 r1 into r2 as nft.record;

    output r2 as nft.record;

    finalize self.caller r0;

finalize convert_public_to_private;
    input r0 as address.public;
    input r1 as u128.public;

    decrement nft_owner_map[r0] by r1;

function transfer_public:
    input r0 as address.private;
    input r1 as u128.private;

    finalize self.caller r0 r1

finalize transfer_public:
    input r0 as address.public;
    input r1 as address.public;
    input r2 as u128.public;

    decrement nft_owner_map[r0] by r2;
    increment nft_owner_map[r1] by r2;
