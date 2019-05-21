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
    uint256 _volume;
    uint256 _peso;
    
    bool CapacidadeEsgotada;
    
    
    struct CargaA {
        uint256 peso;
        string conteudo;
        uint256 volume;
        address proprietario;
        
    }
    
    struct CargaB {
        uint256 peso;
    }
    
    struct CargaC {
        uint256 volume;
        
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
    
    CargaA[] ListaA;
    CargaB[] ListaB;
    CargaC[] ListaC;
   
       
       
       
       event VolumeAdicionado (uint256 peso, uint256 volume);
       
   
     
     
    
    
    function ConhecimentoDeCarga (uint256 peso, string memory conteudo, uint256 volume, address proprietario) public {
       
      
       
       CargaA memory CargaRegistradaA = CargaA (peso, conteudo, volume, proprietario);
       CargaB memory CargaRegistradaB = CargaB (peso);
       CargaC memory CargaRegistradaC = CargaC (volume);
     
      ListaA.push (CargaRegistradaA);
      ListaB.push (CargaRegistradaB);
      ListaC.push (CargaRegistradaC);
      
      
      
      
       
       emit VolumeAdicionado (peso, volume);
       
       CargaAutorizada = true;
       
    }  
    
     
    function CalculoFrete (CargaB memory, CargaC memory) public view returns (uint256 Preco) {
        
        require (CargaAutorizada == true, "RegistreaCarga");
        
        Preco = peso*volume*_Frete;
        return Preco;
        
        
    }
    
     
}
