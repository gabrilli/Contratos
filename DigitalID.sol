/*
pragma solidity 0.4.4;

contract C { 
function test(uint256 a) public returns (bytes32 hash){
    return sha3(a);
 
}
}
https://anders.com/blockchain/hash.html
*/

pragma solidity 0.5.8;

contract DigitalID {
    
    address payable Onwer;
    uint256 Valor;
    //bool InformcaoAnteriormenteRegistrada;
    
       struct DigitalID {
       address Cliente;
       string Nome;
       uint256 CPF;
       uint256 Celular;
       uint256 RG;
       
       
   }
    DigitalID[] ListaClientesA;
    mapping (address => DigitalID) public ListaClientesM;
    
    
    event NovaID (address Cliente, string Nome, uint256 CPF, uint256 Celular, uint256 RG, string Identificador);
    //Identificador é a hash sha256 da strucut+Senha
    
    constructor (address payable _Onwer, uint _Valor) 
        public {
            Onwer = _Onwer;
            Valor = _Valor;
        }
    
    
    function Cadastro (address Cliente, string memory Nome, uint256 CPF, uint256 Celular, uint256 RG, string memory Senha) public payable returns (uint) {
        
        require (msg.value == Valor, "O preco e 100 wei");
        
        DigitalID memory Temp = DigitalID (Cliente, Nome, CPF, Celular, RG);
        ListaClientesA.push(Temp);
        ListaClientesM[Cliente] = Temp;
    }    
        
    
        
       
      
    
}
