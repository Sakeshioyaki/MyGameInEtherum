const MyGame = artifacts.require("MyGame");
contract("MyGame", (account) => {
    it("MyGame se put 100 ATK vao tai khoan dau tien", () =>
        MyGame.deployed()
        .then(instance = instance.balanceOf(account[0]))
    );
});
it("Goi function theo link thu vien sau", () => {
    let MyGame;
    let create_MyCat;
    let view_Cat;
    let levelUp_ByFee;

    return MyGame.deployed()
        .then(instance => {
            MyGame = instance
            return MyGame.balanceOf.call(account[0]);
        })
        .then(instance => {
            create_MyCat = instance.createMyCat("nguyet anh");
            return MyGame.createMyCat.call(account[0]);
        })
        .then(viewCat => {
            view_Cat = viewCat.viewCat(account[0]);
            return MyGame.viewCat.call(account[0]);
        })
        .then(levelUpByFee => {
            levelUp_ByFee = MyGame.levelUpByFee()
            return MyGame.levelUpByFee.call(account[0]);
        })
});