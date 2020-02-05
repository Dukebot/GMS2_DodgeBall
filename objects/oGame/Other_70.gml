/// Async calls from native code

var type = async_load[? "type"];

switch type {
    case GADDidRewardUserWithReward:
		revivePlayer();
        break;
    default:
        break;
}