if (global.pause) exit;
if (instance_number(oGetReady) > 0) exit;

if (global.inventoryMode) playerActions();

movePlayer();
setPlayerSprite();
parpadear();
stayInRoom();