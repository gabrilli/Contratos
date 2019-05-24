pragma solidity 0.5.8;

contract Digitalid {
    
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
        
    function hash (uint i) view public returns (bytes32) {
        return keccak256(abi.encode(ListaClientesA[i].Cliente,ListaClientesA[i].Nome, ListaClientesA[i].CPF, ListaClientesA[i].Celular,ListaClientesA[i].RG));
    }

    // function pagar contrato e dps repassar ao dono.
 
 
 
 
}
