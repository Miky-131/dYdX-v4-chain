/**
 Converts the 'Side' enum from the IndexerOrder protobuf (https://github.com/dydxprotocol/v4-chain/blob/9ed26bd/proto/dydxprotocol/indexer/protocol/v1/clob.proto#L56)
 to the 'OrderSide' enum in postgres.
 */
CREATE OR REPLACE FUNCTION dydx_from_protocol_order_side(order_side jsonb) RETURNS text AS $$
BEGIN
    CASE order_side
        WHEN '1'::jsonb THEN RETURN 'BUY'; /** SIDE_BUY */
        ELSE RETURN 'SELL';
    END CASE;
END;
$$ LANGUAGE plpgsql IMMUTABLE PARALLEL SAFE;
