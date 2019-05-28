pragma solidity 0.5.8;

contract Digitalid {
    
    address payable Onwer;
    uint256 Valor;
    //bool InformcaoAnteriormenteRegistrada;
    
       struct DigitalID {
       address Cliente; //colocar o cliente como agente de cadastro q não precisa ser o mesmo do ID
       string Nome;
       uint256 CPF;
       uint256 Celular;
       uint256 RG;
    }
    
    DigitalID[] ListaClientesA;
    mapping (uint256 => DigitalID) public ListaClientesM;
    
    
    event NovaID (address Cliente, string Nome, uint256 CPF, uint256 Celular, uint256 RG, bytes32 Identificador);
   
    
    constructor (address payable _Onwer, uint _Valor) 
        public {
            Onwer = _Onwer;
            Valor = _Valor;
        }
    
    
    function Cadastro (address Cliente, string memory Nome, uint256 CPF, uint256 Celular, uint256 RG) public payable returns (uint) {
        
        require (msg.value == Valor, "O preco e 100 wei");
        
        DigitalID memory Temp = DigitalID (Cliente, Nome, CPF, Celular, RG);
        ListaClientesA.push(Temp);
        ListaClientesM[CPF] = Temp;
    }    
        
    function GerarID (string memory Senha) public returns (bytes32) {
       uint i;
       bytes32 Identificador = keccak256(abi.encode(ListaClientesA[i].Cliente,ListaClientesA[i].Nome, ListaClientesA[i].CPF, ListaClientesA[i].Celular,ListaClientesA[i].RG, Senha));
       emit NovaID ( ListaClientesA[i].Cliente, ListaClientesA[i].Nome, ListaClientesA[i].CPF, ListaClientesA[i].Celular, ListaClientesA[i].RG, Identificador);
        return Identificador;
    
    Onwer.transfer(address(this).balance);
        
    }
        

}
