pragma solidity 0.5.8;

contract    ContratoBroker {
    
    address payable _CarteiraBroker;
    string _NomeBroker;
    address payable _Armador;
    address payable _Onwer;
    
    
    struct Carga {
        uint256 peso;
        string conteudo;
        uint256 volume;
        address proprietario;
        
    }
    
    
    Carga[] Catalogo;
    
    constructor (
        
        address payable CarteiraBroker,
        string memory NomeBroker
        )
    
    public {
     
     _CarteiraBroker = CarteiraBroker;
     _NomeBroker = NomeBroker;
     
     
     
     
    }
