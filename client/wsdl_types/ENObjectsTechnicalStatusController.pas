unit ENObjectsTechnicalStatusController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns
   , ENElementController
;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:int             - "http://www.w3.org/2001/XMLSchema"
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:decimal         - "http://www.w3.org/2001/XMLSchema"
  // !:date            - "http://www.w3.org/2001/XMLSchema"
  // !:long            - "http://www.w3.org/2001/XMLSchema"
  // !:dateTime        - "http://www.w3.org/2001/XMLSchema"

  ENObjectsTechnicalStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENObjectsTechnicalStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENObjectsTechnicalStatus = class(TRemotable)
  private
    Fcode : Integer;
    FtotalCountWood : Integer;
    FdefectCountWood : Integer;
    FtotalCountArmored : Integer;
    FdefectCountArmored : Integer;
    FtotalCountMetal : Integer;
    FdefectCountMetal : Integer;
    FtotalLengthCable : TXSDecimal;
    FdefectLengthtCable : TXSDecimal;
    FtotalCountInsulator : Integer;
    FdefectCountInsulator : Integer;
    FtotalCountTraverse : Integer;
    FdefectCountTraverse : Integer;
    FtotalCountBranch : Integer;
    FdefectCountBranch : Integer;
    FtotalCountArmature : Integer;
    FdefectCountArmature : Integer;
    FtotalLengthGroundWire : TXSDecimal;
    FdefectLengthGroundWire : TXSDecimal;
    FtotalCountFooting : Integer;
    FdefectCountFooting : Integer;
    FbaseDistance : TXSDecimal;
    FvKDI : TXSDecimal;
    FvKDP : TXSDecimal;
    FvKDO : TXSDecimal;
    FvKDV : TXSDecimal;
    FvKD : TXSDecimal;
    FvKDA : TXSDecimal;
    FvKDT : TXSDecimal;
    FvKDF : TXSDecimal;
    FmaxFallPower : TXSDecimal;
    FlengthToReconstruct : TXSDecimal;
    FvODD : TXSDecimal;
    FvODZ : TXSDecimal;
    FvOUD : TXSDecimal;
    FvOUZ : TXSDecimal;
    FdownTime : TXSDecimal;
    FvolumePower : TXSDecimal;
    FdistributionTariff : TXSDecimal;
    FcompensationNonCompliance : TXSDecimal;
    FcompensationPowerOutage : TXSDecimal;
    FcompensationQuality : TXSDecimal;
    Fpriority : TXSDecimal;
    FpayBackPeriod : TXSDecimal;
    FaverageDailyConsumption : TXSDecimal;
    FcountConsumersByFacility : Integer;
    FtotalCountConsumers : Integer;
    FtotalBreaksPreviousYearMore24 : Integer;
    FtotalBreaksPreviousYear : Integer;
    FrepairCosts : TXSDecimal;
    FaverageRepairCost : TXSDecimal;
    FtechnicalStatus : WideString;
    FfundingSource : WideString;
    FtransferTariff : TXSDecimal;
    Ffine : TXSDecimal;
    FcalcDate : TXSDateTime;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
    Fcommentgen : WideString;
//???
    FelementRef : ENElementRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property totalCountWood : Integer read FtotalCountWood write FtotalCountWood;
    property defectCountWood : Integer read FdefectCountWood write FdefectCountWood;
    property totalCountArmored : Integer read FtotalCountArmored write FtotalCountArmored;
    property defectCountArmored : Integer read FdefectCountArmored write FdefectCountArmored;
    property totalCountMetal : Integer read FtotalCountMetal write FtotalCountMetal;
    property defectCountMetal : Integer read FdefectCountMetal write FdefectCountMetal;
    property totalLengthCable : TXSDecimal read FtotalLengthCable write FtotalLengthCable;
    property defectLengthtCable : TXSDecimal read FdefectLengthtCable write FdefectLengthtCable;
    property totalCountInsulator : Integer read FtotalCountInsulator write FtotalCountInsulator;
    property defectCountInsulator : Integer read FdefectCountInsulator write FdefectCountInsulator;
    property totalCountTraverse : Integer read FtotalCountTraverse write FtotalCountTraverse;
    property defectCountTraverse : Integer read FdefectCountTraverse write FdefectCountTraverse;
    property totalCountBranch : Integer read FtotalCountBranch write FtotalCountBranch;
    property defectCountBranch : Integer read FdefectCountBranch write FdefectCountBranch;
    property totalCountArmature : Integer read FtotalCountArmature write FtotalCountArmature;
    property defectCountArmature : Integer read FdefectCountArmature write FdefectCountArmature;
    property totalLengthGroundWire : TXSDecimal read FtotalLengthGroundWire write FtotalLengthGroundWire;
    property defectLengthGroundWire : TXSDecimal read FdefectLengthGroundWire write FdefectLengthGroundWire;
    property totalCountFooting : Integer read FtotalCountFooting write FtotalCountFooting;
    property defectCountFooting : Integer read FdefectCountFooting write FdefectCountFooting;
    property baseDistance : TXSDecimal read FbaseDistance write FbaseDistance;
    property vKDI : TXSDecimal read FvKDI write FvKDI;
    property vKDP : TXSDecimal read FvKDP write FvKDP;
    property vKDO : TXSDecimal read FvKDO write FvKDO;
    property vKDV : TXSDecimal read FvKDV write FvKDV;
    property vKD : TXSDecimal read FvKD write FvKD;
    property vKDA : TXSDecimal read FvKDA write FvKDA;
    property vKDT : TXSDecimal read FvKDT write FvKDT;
    property vKDF : TXSDecimal read FvKDF write FvKDF;
    property maxFallPower : TXSDecimal read FmaxFallPower write FmaxFallPower;
    property lengthToReconstruct : TXSDecimal read FlengthToReconstruct write FlengthToReconstruct;
    property vODD : TXSDecimal read FvODD write FvODD;
    property vODZ : TXSDecimal read FvODZ write FvODZ;
    property vOUD : TXSDecimal read FvOUD write FvOUD;
    property vOUZ : TXSDecimal read FvOUZ write FvOUZ;
    property downTime : TXSDecimal read FdownTime write FdownTime;
    property volumePower : TXSDecimal read FvolumePower write FvolumePower;
    property distributionTariff : TXSDecimal read FdistributionTariff write FdistributionTariff;
    property compensationNonCompliance : TXSDecimal read FcompensationNonCompliance write FcompensationNonCompliance;
    property compensationPowerOutage : TXSDecimal read FcompensationPowerOutage write FcompensationPowerOutage;
    property compensationQuality : TXSDecimal read FcompensationQuality write FcompensationQuality;
    property priority : TXSDecimal read Fpriority write Fpriority;
    property payBackPeriod : TXSDecimal read FpayBackPeriod write FpayBackPeriod;
    property averageDailyConsumption : TXSDecimal read FaverageDailyConsumption write FaverageDailyConsumption;
    property countConsumersByFacility : Integer read FcountConsumersByFacility write FcountConsumersByFacility;
    property totalCountConsumers : Integer read FtotalCountConsumers write FtotalCountConsumers;
    property totalBreaksPreviousYearMore24 : Integer read FtotalBreaksPreviousYearMore24 write FtotalBreaksPreviousYearMore24;
    property totalBreaksPreviousYear : Integer read FtotalBreaksPreviousYear write FtotalBreaksPreviousYear;
    property repairCosts : TXSDecimal read FrepairCosts write FrepairCosts;
    property averageRepairCost : TXSDecimal read FaverageRepairCost write FaverageRepairCost;
    property technicalStatus : WideString read FtechnicalStatus write FtechnicalStatus;
    property fundingSource : WideString read FfundingSource write FfundingSource;
    property transferTariff : TXSDecimal read FtransferTariff write FtransferTariff;
    property fine : TXSDecimal read Ffine write Ffine;
    property calcDate : TXSDateTime read FcalcDate write FcalcDate;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property commentgen : WideString read Fcommentgen write Fcommentgen;
    property elementRef : ENElementRef read FelementRef write FelementRef;
  end;

{
  ENObjectsTechnicalStatusFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FtotalCountWood : Integer;
    FdefectCountWood : Integer;
    FtotalCountArmored : Integer;
    FdefectCountArmored : Integer;
    FtotalCountMetal : Integer;
    FdefectCountMetal : Integer;
    FtotalLengthCable : TXSDecimal;
    FdefectLengthtCable : TXSDecimal;
    FtotalCountInsulator : Integer;
    FdefectCountInsulator : Integer;
    FtotalCountTraverse : Integer;
    FdefectCountTraverse : Integer;
    FtotalCountBranch : Integer;
    FdefectCountBranch : Integer;
    FtotalCountArmature : Integer;
    FdefectCountArmature : Integer;
    FtotalLengthGroundWire : TXSDecimal;
    FdefectLengthGroundWire : TXSDecimal;
    FtotalCountFooting : Integer;
    FdefectCountFooting : Integer;
    FbaseDistance : TXSDecimal;
    FvKDI : TXSDecimal;
    FvKDP : TXSDecimal;
    FvKDO : TXSDecimal;
    FvKDV : TXSDecimal;
    FvKD : TXSDecimal;
    FvKDA : TXSDecimal;
    FvKDT : TXSDecimal;
    FvKDF : TXSDecimal;
    FmaxFallPower : TXSDecimal;
    FlengthToReconstruct : TXSDecimal;
    FvODD : TXSDecimal;
    FvODZ : TXSDecimal;
    FvOUD : TXSDecimal;
    FvOUZ : TXSDecimal;
    FdownTime : TXSDecimal;
    FvolumePower : TXSDecimal;
    FdistributionTariff : TXSDecimal;
    FcompensationNonCompliance : TXSDecimal;
    FcompensationPowerOutage : TXSDecimal;
    FcompensationQuality : TXSDecimal;
    Fpriority : TXSDecimal;
    FpayBackPeriod : TXSDecimal;
    FaverageDailyConsumption : TXSDecimal;
    FcountConsumersByFacility : Integer;
    FtotalCountConsumers : Integer;
    FtotalBreaksPreviousYearMore24 : Integer;
    FtotalBreaksPreviousYear : Integer;
    FrepairCosts : TXSDecimal;
    FaverageRepairCost : TXSDecimal;
    FtechnicalStatus : WideString;
    FfundingSource : WideString;
    FtransferTariff : TXSDecimal;
    Ffine : TXSDecimal;
    FcalcDate : TXSDateTime;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
    Fcommentgen : WideString;
//???
    FelementRef : ENElementRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property totalCountWood : Integer read FtotalCountWood write FtotalCountWood;
    property defectCountWood : Integer read FdefectCountWood write FdefectCountWood;
    property totalCountArmored : Integer read FtotalCountArmored write FtotalCountArmored;
    property defectCountArmored : Integer read FdefectCountArmored write FdefectCountArmored;
    property totalCountMetal : Integer read FtotalCountMetal write FtotalCountMetal;
    property defectCountMetal : Integer read FdefectCountMetal write FdefectCountMetal;
    property totalLengthCable : TXSDecimal read FtotalLengthCable write FtotalLengthCable;
    property defectLengthtCable : TXSDecimal read FdefectLengthtCable write FdefectLengthtCable;
    property totalCountInsulator : Integer read FtotalCountInsulator write FtotalCountInsulator;
    property defectCountInsulator : Integer read FdefectCountInsulator write FdefectCountInsulator;
    property totalCountTraverse : Integer read FtotalCountTraverse write FtotalCountTraverse;
    property defectCountTraverse : Integer read FdefectCountTraverse write FdefectCountTraverse;
    property totalCountBranch : Integer read FtotalCountBranch write FtotalCountBranch;
    property defectCountBranch : Integer read FdefectCountBranch write FdefectCountBranch;
    property totalCountArmature : Integer read FtotalCountArmature write FtotalCountArmature;
    property defectCountArmature : Integer read FdefectCountArmature write FdefectCountArmature;
    property totalLengthGroundWire : TXSDecimal read FtotalLengthGroundWire write FtotalLengthGroundWire;
    property defectLengthGroundWire : TXSDecimal read FdefectLengthGroundWire write FdefectLengthGroundWire;
    property totalCountFooting : Integer read FtotalCountFooting write FtotalCountFooting;
    property defectCountFooting : Integer read FdefectCountFooting write FdefectCountFooting;
    property baseDistance : TXSDecimal read FbaseDistance write FbaseDistance;
    property vKDI : TXSDecimal read FvKDI write FvKDI;
    property vKDP : TXSDecimal read FvKDP write FvKDP;
    property vKDO : TXSDecimal read FvKDO write FvKDO;
    property vKDV : TXSDecimal read FvKDV write FvKDV;
    property vKD : TXSDecimal read FvKD write FvKD;
    property vKDA : TXSDecimal read FvKDA write FvKDA;
    property vKDT : TXSDecimal read FvKDT write FvKDT;
    property vKDF : TXSDecimal read FvKDF write FvKDF;
    property maxFallPower : TXSDecimal read FmaxFallPower write FmaxFallPower;
    property lengthToReconstruct : TXSDecimal read FlengthToReconstruct write FlengthToReconstruct;
    property vODD : TXSDecimal read FvODD write FvODD;
    property vODZ : TXSDecimal read FvODZ write FvODZ;
    property vOUD : TXSDecimal read FvOUD write FvOUD;
    property vOUZ : TXSDecimal read FvOUZ write FvOUZ;
    property downTime : TXSDecimal read FdownTime write FdownTime;
    property volumePower : TXSDecimal read FvolumePower write FvolumePower;
    property distributionTariff : TXSDecimal read FdistributionTariff write FdistributionTariff;
    property compensationNonCompliance : TXSDecimal read FcompensationNonCompliance write FcompensationNonCompliance;
    property compensationPowerOutage : TXSDecimal read FcompensationPowerOutage write FcompensationPowerOutage;
    property compensationQuality : TXSDecimal read FcompensationQuality write FcompensationQuality;
    property priority : TXSDecimal read Fpriority write Fpriority;
    property payBackPeriod : TXSDecimal read FpayBackPeriod write FpayBackPeriod;
    property averageDailyConsumption : TXSDecimal read FaverageDailyConsumption write FaverageDailyConsumption;
    property countConsumersByFacility : Integer read FcountConsumersByFacility write FcountConsumersByFacility;
    property totalCountConsumers : Integer read FtotalCountConsumers write FtotalCountConsumers;
    property totalBreaksPreviousYearMore24 : Integer read FtotalBreaksPreviousYearMore24 write FtotalBreaksPreviousYearMore24;
    property totalBreaksPreviousYear : Integer read FtotalBreaksPreviousYear write FtotalBreaksPreviousYear;
    property repairCosts : TXSDecimal read FrepairCosts write FrepairCosts;
    property averageRepairCost : TXSDecimal read FaverageRepairCost write FaverageRepairCost;
    property technicalStatus : WideString read FtechnicalStatus write FtechnicalStatus;
    property fundingSource : WideString read FfundingSource write FfundingSource;
    property transferTariff : TXSDecimal read FtransferTariff write FtransferTariff;
    property fine : TXSDecimal read Ffine write Ffine;
    property calcDate : TXSDateTime read FcalcDate write FcalcDate;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property commentgen : WideString read Fcommentgen write Fcommentgen;
    property elementRef : ENElementRef read FelementRef write FelementRef;
  end;
}

  ENObjectsTechnicalStatusFilter = class(ENObjectsTechnicalStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENObjectsTechnicalStatusShort = class(TRemotable)
  private
    Fcode : Integer;
    FtotalCountWood : Integer;
    FdefectCountWood : Integer;
    FtotalCountArmored : Integer;
    FdefectCountArmored : Integer;
    FtotalCountMetal : Integer;
    FdefectCountMetal : Integer;
    FtotalLengthCable : TXSDecimal;
    FdefectLengthtCable : TXSDecimal;
    FtotalCountInsulator : Integer;
    FdefectCountInsulator : Integer;
    FtotalCountTraverse : Integer;
    FdefectCountTraverse : Integer;
    FtotalCountBranch : Integer;
    FdefectCountBranch : Integer;
    FtotalCountArmature : Integer;
    FdefectCountArmature : Integer;
    FtotalLengthGroundWire : TXSDecimal;
    FdefectLengthGroundWire : TXSDecimal;
    FtotalCountFooting : Integer;
    FdefectCountFooting : Integer;
    FbaseDistance : TXSDecimal;
    FvKDI : TXSDecimal;
    FvKDP : TXSDecimal;
    FvKDO : TXSDecimal;
    FvKDV : TXSDecimal;
    FvKD : TXSDecimal;
    FvKDA : TXSDecimal;
    FvKDT : TXSDecimal;
    FvKDF : TXSDecimal;
    FmaxFallPower : TXSDecimal;
    FlengthToReconstruct : TXSDecimal;
    FvODD : TXSDecimal;
    FvODZ : TXSDecimal;
    FvOUD : TXSDecimal;
    FvOUZ : TXSDecimal;
    FdownTime : TXSDecimal;
    FvolumePower : TXSDecimal;
    FdistributionTariff : TXSDecimal;
    FcompensationNonCompliance : TXSDecimal;
    FcompensationPowerOutage : TXSDecimal;
    FcompensationQuality : TXSDecimal;
    Fpriority : TXSDecimal;
    FpayBackPeriod : TXSDecimal;
    FaverageDailyConsumption : TXSDecimal;
    FcountConsumersByFacility : Integer;
    FtotalCountConsumers : Integer;
    FtotalBreaksPreviousYearMore24 : Integer;
    FtotalBreaksPreviousYear : Integer;
    FrepairCosts : TXSDecimal;
    FaverageRepairCost : TXSDecimal;
    FtechnicalStatus : WideString;
    FfundingSource : WideString;
    FtransferTariff : TXSDecimal;
    Ffine : TXSDecimal;
    FcalcDate : TXSDateTime;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fcommentgen : WideString;
    FelementRefCode : Integer;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  totalCountWood : Integer read FtotalCountWood write FtotalCountWood;
    property  defectCountWood : Integer read FdefectCountWood write FdefectCountWood;
    property  totalCountArmored : Integer read FtotalCountArmored write FtotalCountArmored;
    property  defectCountArmored : Integer read FdefectCountArmored write FdefectCountArmored;
    property  totalCountMetal : Integer read FtotalCountMetal write FtotalCountMetal;
    property  defectCountMetal : Integer read FdefectCountMetal write FdefectCountMetal;
    property totalLengthCable : TXSDecimal read FtotalLengthCable write FtotalLengthCable;
    property defectLengthtCable : TXSDecimal read FdefectLengthtCable write FdefectLengthtCable;
    property  totalCountInsulator : Integer read FtotalCountInsulator write FtotalCountInsulator;
    property  defectCountInsulator : Integer read FdefectCountInsulator write FdefectCountInsulator;
    property  totalCountTraverse : Integer read FtotalCountTraverse write FtotalCountTraverse;
    property  defectCountTraverse : Integer read FdefectCountTraverse write FdefectCountTraverse;
    property  totalCountBranch : Integer read FtotalCountBranch write FtotalCountBranch;
    property  defectCountBranch : Integer read FdefectCountBranch write FdefectCountBranch;
    property  totalCountArmature : Integer read FtotalCountArmature write FtotalCountArmature;
    property  defectCountArmature : Integer read FdefectCountArmature write FdefectCountArmature;
    property totalLengthGroundWire : TXSDecimal read FtotalLengthGroundWire write FtotalLengthGroundWire;
    property defectLengthGroundWire : TXSDecimal read FdefectLengthGroundWire write FdefectLengthGroundWire;
    property  totalCountFooting : Integer read FtotalCountFooting write FtotalCountFooting;
    property  defectCountFooting : Integer read FdefectCountFooting write FdefectCountFooting;
    property baseDistance : TXSDecimal read FbaseDistance write FbaseDistance;
    property vKDI : TXSDecimal read FvKDI write FvKDI;
    property vKDP : TXSDecimal read FvKDP write FvKDP;
    property vKDO : TXSDecimal read FvKDO write FvKDO;
    property vKDV : TXSDecimal read FvKDV write FvKDV;
    property vKD : TXSDecimal read FvKD write FvKD;
    property vKDA : TXSDecimal read FvKDA write FvKDA;
    property vKDT : TXSDecimal read FvKDT write FvKDT;
    property vKDF : TXSDecimal read FvKDF write FvKDF;
    property maxFallPower : TXSDecimal read FmaxFallPower write FmaxFallPower;
    property lengthToReconstruct : TXSDecimal read FlengthToReconstruct write FlengthToReconstruct;
    property vODD : TXSDecimal read FvODD write FvODD;
    property vODZ : TXSDecimal read FvODZ write FvODZ;
    property vOUD : TXSDecimal read FvOUD write FvOUD;
    property vOUZ : TXSDecimal read FvOUZ write FvOUZ;
    property downTime : TXSDecimal read FdownTime write FdownTime;
    property volumePower : TXSDecimal read FvolumePower write FvolumePower;
    property distributionTariff : TXSDecimal read FdistributionTariff write FdistributionTariff;
    property compensationNonCompliance : TXSDecimal read FcompensationNonCompliance write FcompensationNonCompliance;
    property compensationPowerOutage : TXSDecimal read FcompensationPowerOutage write FcompensationPowerOutage;
    property compensationQuality : TXSDecimal read FcompensationQuality write FcompensationQuality;
    property priority : TXSDecimal read Fpriority write Fpriority;
    property payBackPeriod : TXSDecimal read FpayBackPeriod write FpayBackPeriod;
    property averageDailyConsumption : TXSDecimal read FaverageDailyConsumption write FaverageDailyConsumption;
    property  countConsumersByFacility : Integer read FcountConsumersByFacility write FcountConsumersByFacility;
    property  totalCountConsumers : Integer read FtotalCountConsumers write FtotalCountConsumers;
    property  totalBreaksPreviousYearMore24 : Integer read FtotalBreaksPreviousYearMore24 write FtotalBreaksPreviousYearMore24;
    property  totalBreaksPreviousYear : Integer read FtotalBreaksPreviousYear write FtotalBreaksPreviousYear;
    property repairCosts : TXSDecimal read FrepairCosts write FrepairCosts;
    property averageRepairCost : TXSDecimal read FaverageRepairCost write FaverageRepairCost;
    property technicalStatus : WideString read FtechnicalStatus write FtechnicalStatus;
    property fundingSource : WideString read FfundingSource write FfundingSource;
    property transferTariff : TXSDecimal read FtransferTariff write FtransferTariff;
    property fine : TXSDecimal read Ffine write Ffine;
    property calcDate : TXSDateTime read FcalcDate write FcalcDate;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property commentgen : WideString read Fcommentgen write Fcommentgen;

    property elementRefCode : Integer read FelementRefCode write FelementRefCode;
  end;

  ArrayOfENObjectsTechnicalStatusShort = array of ENObjectsTechnicalStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENObjectsTechnicalStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENObjectsTechnicalStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENObjectsTechnicalStatusShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENObjectsTechnicalStatusController/message/
  // soapAction: http://ksoe.org/ENObjectsTechnicalStatusController/action/ENObjectsTechnicalStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENObjectsTechnicalStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENObjectsTechnicalStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //

  ENObjectsTechnicalStatusControllerSoapPort = interface(IInvokable)
  ['{99AAF1A6-1766-47FF-A226-F5A7114DEFC9}']
    function add(const aENObjectsTechnicalStatus: ENObjectsTechnicalStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENObjectsTechnicalStatus: ENObjectsTechnicalStatus); stdcall;
    function getObject(const anObjectCode: Integer): ENObjectsTechnicalStatus; stdcall;
    function getList: ENObjectsTechnicalStatusShortList; stdcall;
    function getFilteredList(const aENObjectsTechnicalStatusFilter: ENObjectsTechnicalStatusFilter): ENObjectsTechnicalStatusShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENObjectsTechnicalStatusShortList; stdcall;
    function getScrollableFilteredList(const aENObjectsTechnicalStatusFilter: ENObjectsTechnicalStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ENObjectsTechnicalStatusShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENObjectsTechnicalStatusShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENObjectsTechnicalStatusFilter: ENObjectsTechnicalStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENObjectsTechnicalStatusShort; stdcall;

    // определения расстояния от базы обслуживания до ПС...
    function getBaseDistance(const line10Code: Integer): TXSDecimal; stdcall;
    function getBaseDistanceByElementCode(const elementCode: Integer): TXSDecimal; stdcall;
  end;



implementation

  destructor ENObjectsTechnicalStatus.Destroy;
  begin
    if Assigned(FtotalLengthCable) then
      totalLengthCable.Free;
    if Assigned(FdefectLengthtCable) then
      defectLengthtCable.Free;
    if Assigned(FtotalLengthGroundWire) then
      totalLengthGroundWire.Free;
    if Assigned(FdefectLengthGroundWire) then
      defectLengthGroundWire.Free;
    if Assigned(FbaseDistance) then
      baseDistance.Free;
    if Assigned(FvKDI) then
      vKDI.Free;
    if Assigned(FvKDP) then
      vKDP.Free;
    if Assigned(FvKDO) then
      vKDO.Free;
    if Assigned(FvKDV) then
      vKDV.Free;
    if Assigned(FvKD) then
      vKD.Free;
    if Assigned(FvKDA) then
      vKDA.Free;
    if Assigned(FvKDT) then
      vKDT.Free;
    if Assigned(FvKDF) then
      vKDF.Free;
    if Assigned(FmaxFallPower) then
      maxFallPower.Free;
    if Assigned(FlengthToReconstruct) then
      lengthToReconstruct.Free;
    if Assigned(FvODD) then
      vODD.Free;
    if Assigned(FvODZ) then
      vODZ.Free;
    if Assigned(FvOUD) then
      vOUD.Free;
    if Assigned(FvOUZ) then
      vOUZ.Free;
    if Assigned(FdownTime) then
      downTime.Free;
    if Assigned(FvolumePower) then
      volumePower.Free;
    if Assigned(FdistributionTariff) then
      distributionTariff.Free;
    if Assigned(FcompensationNonCompliance) then
      compensationNonCompliance.Free;
    if Assigned(FcompensationPowerOutage) then
      compensationPowerOutage.Free;
    if Assigned(FcompensationQuality) then
      compensationQuality.Free;
    if Assigned(Fpriority) then
      priority.Free;
    if Assigned(FpayBackPeriod) then
      payBackPeriod.Free;
    if Assigned(FaverageDailyConsumption) then
      averageDailyConsumption.Free;
    if Assigned(FrepairCosts) then
      repairCosts.Free;
    if Assigned(FaverageRepairCost) then
      averageRepairCost.Free;
    if Assigned(FtransferTariff) then
      transferTariff.Free;
    if Assigned(Ffine) then
      fine.Free;
    if Assigned(FcalcDate) then
      calcDate.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FelementRef) then
      elementRef.Free;
    inherited Destroy;
  end;

{
  destructor ENObjectsTechnicalStatusFilter.Destroy;
  begin
    if Assigned(FtotalLengthCable) then
      totalLengthCable.Free;
    if Assigned(FdefectLengthtCable) then
      defectLengthtCable.Free;
    if Assigned(FtotalLengthGroundWire) then
      totalLengthGroundWire.Free;
    if Assigned(FdefectLengthGroundWire) then
      defectLengthGroundWire.Free;
    if Assigned(FbaseDistance) then
      baseDistance.Free;
    if Assigned(FvKDI) then
      vKDI.Free;
    if Assigned(FvKDP) then
      vKDP.Free;
    if Assigned(FvKDO) then
      vKDO.Free;
    if Assigned(FvKDV) then
      vKDV.Free;
    if Assigned(FvKD) then
      vKD.Free;
    if Assigned(FvKDA) then
      vKDA.Free;
    if Assigned(FvKDT) then
      vKDT.Free;
    if Assigned(FvKDF) then
      vKDF.Free;
    if Assigned(FmaxFallPower) then
      maxFallPower.Free;
    if Assigned(FlengthToReconstruct) then
      lengthToReconstruct.Free;
    if Assigned(FvODD) then
      vODD.Free;
    if Assigned(FvODZ) then
      vODZ.Free;
    if Assigned(FvOUD) then
      vOUD.Free;
    if Assigned(FvOUZ) then
      vOUZ.Free;
    if Assigned(FdownTime) then
      downTime.Free;
    if Assigned(FvolumePower) then
      volumePower.Free;
    if Assigned(FdistributionTariff) then
      distributionTariff.Free;
    if Assigned(FcompensationNonCompliance) then
      compensationNonCompliance.Free;
    if Assigned(FcompensationPowerOutage) then
      compensationPowerOutage.Free;
    if Assigned(FcompensationQuality) then
      compensationQuality.Free;
    if Assigned(Fpriority) then
      priority.Free;
    if Assigned(FpayBackPeriod) then
      payBackPeriod.Free;
    if Assigned(FaverageDailyConsumption) then
      averageDailyConsumption.Free;
    if Assigned(FrepairCosts) then
      repairCosts.Free;
    if Assigned(FaverageRepairCost) then
      averageRepairCost.Free;
    if Assigned(FtransferTariff) then
      transferTariff.Free;
    if Assigned(Ffine) then
      fine.Free;
    if Assigned(FcalcDate) then
      calcDate.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FelementRef) then
      elementRef.Free;
    inherited Destroy;
  end;
}

  destructor ENObjectsTechnicalStatusFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENObjectsTechnicalStatusShort.Destroy;
  begin
    if Assigned(FtotalLengthCable) then
      totalLengthCable.Free;
    if Assigned(FdefectLengthtCable) then
      defectLengthtCable.Free;
    if Assigned(FtotalLengthGroundWire) then
      totalLengthGroundWire.Free;
    if Assigned(FdefectLengthGroundWire) then
      defectLengthGroundWire.Free;
    if Assigned(FbaseDistance) then
      baseDistance.Free;
    if Assigned(FvKDI) then
      vKDI.Free;
    if Assigned(FvKDP) then
      vKDP.Free;
    if Assigned(FvKDO) then
      vKDO.Free;
    if Assigned(FvKDV) then
      vKDV.Free;
    if Assigned(FvKD) then
      vKD.Free;
    if Assigned(FvKDA) then
      vKDA.Free;
    if Assigned(FvKDT) then
      vKDT.Free;
    if Assigned(FvKDF) then
      vKDF.Free;
    if Assigned(FmaxFallPower) then
      maxFallPower.Free;
    if Assigned(FlengthToReconstruct) then
      lengthToReconstruct.Free;
    if Assigned(FvODD) then
      vODD.Free;
    if Assigned(FvODZ) then
      vODZ.Free;
    if Assigned(FvOUD) then
      vOUD.Free;
    if Assigned(FvOUZ) then
      vOUZ.Free;
    if Assigned(FdownTime) then
      downTime.Free;
    if Assigned(FvolumePower) then
      volumePower.Free;
    if Assigned(FdistributionTariff) then
      distributionTariff.Free;
    if Assigned(FcompensationNonCompliance) then
      compensationNonCompliance.Free;
    if Assigned(FcompensationPowerOutage) then
      compensationPowerOutage.Free;
    if Assigned(FcompensationQuality) then
      compensationQuality.Free;
    if Assigned(Fpriority) then
      priority.Free;
    if Assigned(FpayBackPeriod) then
      payBackPeriod.Free;
    if Assigned(FaverageDailyConsumption) then
      averageDailyConsumption.Free;
    if Assigned(FrepairCosts) then
      repairCosts.Free;
    if Assigned(FaverageRepairCost) then
      averageRepairCost.Free;
    if Assigned(FtransferTariff) then
      transferTariff.Free;
    if Assigned(Ffine) then
      fine.Free;
    if Assigned(FcalcDate) then
      calcDate.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    inherited Destroy;
  end;

  destructor ENObjectsTechnicalStatusShortList.Destroy;
  var
    I: Integer;
  begin
    for I := 0 to Length(Flist)-1 do
     if Assigned(Flist[I]) then
       Flist[I].Free;
     SetLength(Flist, 0);
     inherited Destroy;
  end;



initialization

  RemClassRegistry.RegisterXSClass(ENObjectsTechnicalStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'ENObjectsTechnicalStatus');
  RemClassRegistry.RegisterXSClass(ENObjectsTechnicalStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENObjectsTechnicalStatusRef');
  RemClassRegistry.RegisterXSClass(ENObjectsTechnicalStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENObjectsTechnicalStatusFilter');
  RemClassRegistry.RegisterXSClass(ENObjectsTechnicalStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENObjectsTechnicalStatusShort');
  RemClassRegistry.RegisterXSClass(ENObjectsTechnicalStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENObjectsTechnicalStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENObjectsTechnicalStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENObjectsTechnicalStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(ENObjectsTechnicalStatusControllerSoapPort), 'http://ksoe.org/ENObjectsTechnicalStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENObjectsTechnicalStatusControllerSoapPort), 'http://ksoe.org/ENObjectsTechnicalStatusController/action/ENObjectsTechnicalStatusController.%operationName%');


end.
