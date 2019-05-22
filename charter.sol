pragma solidity 0.5.8;

contract    ContratoBroker {
    
    address payable _CarteiraBroker;
    string _NomeBroker;
    address payable _Armador;
    address payable _Onwer;
    uint256 _Frete;
    uint256 _CapacidadeVolume;
    uint256 _CapacidadePeso;
    bool CargaAutorizada;
    uint256 volume;
    uint256 peso;
    uint256 preco;
    
    bool CapacidadeEsgotada;
    
    
    struct Carga {
       
        uint256 peso;
        string conteudo;
        uint256 volume;
        address proprietario;
        
    }
    
    constructor (
        
        address payable CarteiraBroker,
        string memory NomeBroker,
        address payable Armador,
        uint256 Frete,
        uint256 CapacidadePeso,
        uint256 CapacidadeVolume
        
    )
    
    public {
     
     _CarteiraBroker = CarteiraBroker;
     _NomeBroker = NomeBroker;
     _Armador = Armador;
     _Frete = Frete;
     _CapacidadePeso = CapacidadePeso;
     _CapacidadeVolume = CapacidadeVolume;
     
     
    }
    
    Carga[]  ListaA;
    //mapping (address => CargaB) public ListaB;
    
    event VolumeAdicionado (uint256 peso, uint256 volume);
    
    
    function LimiteDeContratacao () public view returns (uint256) {
        
        uint256 LimiteP;
        
        for (uint i=0; i<ListaA.length; i++) {
            LimiteP = ListaA[i].peso+LimiteP;
        }
        
        uint256 CapacidadeRestanteP;
        CapacidadeRestanteP = _CapacidadePeso - LimiteP;
    
        uint LimiteV;
        for (uint i=0; i<ListaA.length; i++) {
            LimiteV = ListaA[i].volume+LimiteV;
        }
        
        uint256 CapacidadeRestanteV;
        CapacidadeRestanteV = _CapacidadeVolume - LimiteV;
        
        
        
        
    }   
   
    function ConhecimentoDeCarga (uint256 peso, string memory conteudo, uint256 volume, address proprietario)  public   {
     
     
     
        
            Carga memory CargaRegistrada = Carga (peso, conteudo, volume, proprietario);
            ListaA.push (CargaRegistrada);
            emit VolumeAdicionado (peso, volume);
           
            CargaAutorizada = true;
        
     
    }  
    
    function CalculoFrete (uint256 Y) public view returns (uint256 Preco) {
        require (CargaAutorizada == true, "RegistreaCarga");
        Preco = ListaA[Y].peso*ListaA[Y].volume*_Frete;
        return Preco;
    }
    
    
    
    
     
     
}
