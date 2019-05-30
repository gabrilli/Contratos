pragma solidity 0.5.9;

contract Digitalid {
    
    address payable Onwer;
    uint256 Valor;
    address Parceiro;
    
   
    
       struct DigitalID {
       string Nome;
       uint256 CPF;
       uint256 Celular;
       bytes32 Identificador;
    }
    
    DigitalID[] ListaClientesA;
    mapping (uint256 => DigitalID) public ListaClientesM1;
    mapping (bytes32 => DigitalID) public ListaClientesM2;
    mapping (uint256 => DigitalID) public ListaClientesM3;
    mapping (string => DigitalID) public ListaClientesM4;
    
    
    
    event NovaID (string Nome, uint256 CPF, uint256 Celular, bytes32 Identificador);
    event VerificarID (bool);
   
    
    constructor (address payable _Onwer, uint _Valor, address _Parceiro) 
        public {
            Onwer = _Onwer;
            Valor = _Valor;
            Parceiro = _Parceiro;
        }
    
   
    function GerarID (string memory Nome, uint256 CPF, uint256 Celular, string memory Senha) public payable returns (bytes32) {
       
       
       require (msg.value == Valor, "Pague o valor correto");
       
       
       bytes32 Identificador = keccak256(abi.encode(Nome, CPF, Celular, Senha));
       
        
        DigitalID memory Temp = DigitalID (Nome, CPF, Celular, Identificador);
        ListaClientesA.push(Temp);
        ListaClientesM1[CPF] = Temp;
        ListaClientesM2[Identificador]=Temp;
        ListaClientesM3[Celular]=Temp;
        ListaClientesM4[Nome]=Temp;
            
        
        emit NovaID (Nome, CPF, Celular, Identificador);
        
    
    Onwer.transfer(address(this).balance);
        
    }
   */
   //function VerificarID () public returns (bool) {
    function Deletar ID
    
       
       
  /*
   
}
