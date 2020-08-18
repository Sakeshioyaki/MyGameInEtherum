//SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <=0.7.0;

import "./IERC20.sol";
import "./SafeMath.sol";
import "./MYCAT.sol";
import "./Context.sol";


contract MyGame is IERC20, Context {
    using SafeMath for uint256;
    using SafeMath for address;
    using SafeMath for uint32;
    using SafeMath for uint8;
    //using Address for address;

    uint upLevelFee = 5;
    uint modulus = 100;

    MYCAT[] public cats;
    uint public countCat;

    mapping (address => uint) public myCat;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    string private  _name = 'Anh Token';
    string private  _symbol = 'ATK';
    uint8 private  _decimals = 2; //0.01
    uint _totalSupply = 1000000;

    constructor() {
        _mint(msg.sender, 100);
    }

function createMyCat(string memory name) external {
    countCat++;
    myCat[_msgSender()] = countCat;
    MYCAT storage pet = new MYCAT();
    pet.name = name;
    pet.id = countCat++;
    addCat(pet);
    }

function addCat(MYCAT u) internal {
    cats.push(u);
    }

function showNameCat(address curr) public view returns (string memory) {
        return cats[myCat[curr]].name();
    }

function showLevelCat(address curr) public view returns (uint8) {
        uint8 leve = cats[myCat[curr]].level();
        return leve;
    }

function showExperience(address curr) public view returns (uint32) {
        return cats[myCat[curr]].experience();
    }

function levelUpByFee() view public {
    require(balanceOf(_msgSender()) >= upLevelFee, "Balances isn't enought !");
    _balances[_msgSender()].sub(upLevelFee);
    cats[myCat[_msgSender()]].levelUpCat();
    }

function attackTmp(address orther, uint8 luckyNumber) public view returns(bool) {
    uint level1;
    uint lucky;
    lucky = randMod(luckyNumber);
    if(cats[myCat[_msgSender()]].level() >= cats[myCat[orther]].level()){
        level1 = (cats[myCat[_msgSender()]].level().sub(cats[myCat[orther]].level())).div(cats[myCat[_msgSender()]].levelMax());
        if(lucky.add(level1) >= 100 ) return true;
        else return false;
    }
    else {
        level1 = 1 - (cats[myCat[orther]].level().sub(cats[myCat[_msgSender()]].level())).div(cats[myCat[_msgSender()]].levelMax());
        return false;
    }
}

function attack(address orther, uint8 luckyNumber) external returns(bool) {
    require((cats[myCat[_msgSender()]].level() > 1) || (cats[myCat[_msgSender()]].level() >= cats[myCat[_msgSender()]].exAdd()), "Can't attack !");
    bool result = attackTmp(orther, luckyNumber);
    if(result  == true){
    
        cats[myCat[orther]].upExpCat();
        cats[myCat[_msgSender()]].upExpCat();
    }
    else{
        cats[myCat[_msgSender()]].downExpCat();
        cats[myCat[orther]].upExpCat();
    }
    return result;

}

function randMod(uint8 luckyNumber) public view returns(uint) {
    return uint(keccak256(abi.encodePacked(block.timestamp, _msgSender(), luckyNumber))).mod(modulus);
  }

    /**
     * @dev Returns the name of the token.
     */
function name() public view returns (string memory) {
        return _name;
}

    /**
     * @dev Returns the symbol of the token, usually a shorter version of the
     * name.
     */
function symbol() public view returns (string memory) {
        return _symbol;
    }

function decimals() public view returns (uint8) {
        return _decimals;
    }

    /**
     * @dev See {IERC20-totalSupply}.
     */
function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }

    /**
     * @dev See {IERC20-balanceOf}.
     */
function balanceOf(address account) public view override returns (uint256) {
        return _balances[account];
    }

function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    /**
     * @dev See {IERC20-allowance}.
     */
function allowance(address owner, address spender) public view virtual override returns (uint256) {
        return _allowances[owner][spender];
    }

    /**
     * @dev See {IERC20-approve}.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
function approve(address spender, uint256 amount) public virtual override returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }

    /**
     * @dev See {IERC20-transferFrom}.
     *
     * Emits an {Approval} event indicating the updated allowance. This is not
     * required by the EIP. See the note at the beginning of {ERC20};
     *
     * Requirements:
     * - `sender` and `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     * - the caller must have allowance for ``sender``'s tokens of at least
     * `amount`.
     */
function transferFrom(address sender, address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(sender, _msgSender(), _allowances[sender][_msgSender()].sub(amount));
        return true;
    }

    /**
     * @dev Atomically increases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].add(addedValue));
        return true;
    }

    /**
     * @dev Atomically decreases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     * - `spender` must have allowance for the caller of at least
     * `subtractedValue`.
     */
function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].sub(subtractedValue));
        return true;
    }

    /**
     * @dev Moves tokens `amount` from `sender` to `recipient`.
     *
     * This is internal function is equivalent to {transfer}, and can be used to
     * e.g. implement automatic token fees, slashing mechanisms, etc.
     *
     * Emits a {Transfer} event.
     *
     * Requirements:
     *
     * - `sender` cannot be the zero address.
     * - `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     */
function _transfer(address sender, address recipient, uint256 amount) internal virtual {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _beforeTokenTransfer(sender, recipient, amount);

        _balances[sender] = _balances[sender].sub(amount);
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(sender, recipient, amount);
    }

    /** @dev Creates `amount` tokens and assigns them to `account`, increasing
     * the total supply.
     *
     * Emits a {Transfer} event with `from` set to the zero address.
     *
     * Requirements
     *
     * - `to` cannot be the zero address.
     */
function _mint(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: mint to the zero address");

        _beforeTokenTransfer(address(0), account, amount);

        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
        emit Transfer(address(0), account, amount);
    }

    /**
     * @dev Destroys `amount` tokens from `account`, reducing the
     * total supply.
     *
     * Emits a {Transfer} event with `to` set to the zero address.
     *
     * Requirements
     *
     * - `account` cannot be the zero address.
     * - `account` must have at least `amount` tokens.
     */
function _burn(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: burn from the zero address");

        _beforeTokenTransfer(account, address(0), amount);

        _balances[account] = _balances[account].sub(amount);
        _totalSupply = _totalSupply.sub(amount);
        emit Transfer(account, address(0), amount);
    }

    /**
     * @dev Sets `amount` as the allowance of `spender` over the `owner`s tokens.
     *
     * This is internal function is equivalent to `approve`, and can be used to
     * e.g. set automatic allowances for certain subsystems, etc.
     *
     * Emits an {Approval} event.
     *
     * Requirements:
     *
     * - `owner` cannot be the zero address.
     * - `spender` cannot be the zero address.
     */
function _approve(address owner, address spender, uint256 amount) internal virtual {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    /**
     * @dev Sets {decimals} to a value other than the default one of 18.
     *
     * WARNING: This function should only be called from the constructor. Most
     * applications that interact with token contracts will not expect
     * {decimals} to ever change, and may work incorrectly if it does.
     */
function _setupDecimals(uint8 decimals_) internal {
        _decimals = decimals_;
    }

    /**
     * @dev Hook that is called before any transfer of tokens. This includes
     * minting and burning.
     *
     * Calling conditions:
     *
     * - when `from` and `to` are both non-zero, `amount` of ``from``'s tokens
     * will be to transferred to `to`.
     * - when `from` is zero, `amount` tokens will be minted for `to`.
     * - when `to` is zero, `amount` of ``from``'s tokens will be burned.
     * - `from` and `to` are never both zero.
     *
     * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].
     */
function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual {}

}

