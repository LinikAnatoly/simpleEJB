unit RegulatoryAssetBaseCalculationController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2;

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

  RegulatoryAssetBaseCalculation            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RegulatoryAssetBaseCalculationRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;

      // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RegulatoryAssetBaseRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RegulatoryAssetBaseGroupRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;
  
  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RegulatoryAssetBaseFundingSourceRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RegulatoryAssetBaseCalculation = class(TRemotable)
  private
    Fcode : Integer;
    Fperiod : TXSDate;
    ForiginalValue : TXSDecimal;
    Fdepreciation : TXSDecimal;
    FresidualValue : TXSDecimal;
    FwrittenOffValue : TXSDecimal;
//???
    FassetRef : RegulatoryAssetBaseRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property period : TXSDate read Fperiod write Fperiod;
    property originalValue : TXSDecimal read ForiginalValue write ForiginalValue;
    property depreciation : TXSDecimal read Fdepreciation write Fdepreciation;
    property residualValue : TXSDecimal read FresidualValue write FresidualValue;
    property writtenOffValue : TXSDecimal read FwrittenOffValue write FwrittenOffValue;
    property assetRef : RegulatoryAssetBaseRef read FassetRef write FassetRef;
  end;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RegulatoryAssetBase = class(TRemotable)
  private
    Fcode : Integer;
    FinventoryNumber : WideString;
    FinventoryCode : Integer;
    Fname : WideString;
    FincomeDate : TXSDate;
    FdocumentNumber : WideString;
    ForiginalValue : TXSDecimal;
    FusefulLife : Integer;
    Finitial : TXSBoolean;
    FwriteOffNumber : WideString;
    FwriteOffDate : TXSDate;
    Finvestition : TXSBoolean;
    FinvestitionProgramName : WideString;
    FinvestitionProgramYear : Integer;
    FinvestitionProgramCipher : WideString;
    Fconnection : TXSBoolean;
    FconnectionNumber : WideString;
    FconnectionDate : TXSDate;
    FconnectionContragent : WideString;
    FcategoryCode : Integer;
    FparentRef : RegulatoryAssetBaseRef;
    FgroupRef : RegulatoryAssetBaseGroupRef;
    FfundingSourceRef : RegulatoryAssetBaseFundingSourceRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property inventoryNumber : WideString read FinventoryNumber write FinventoryNumber;
    property inventoryCode : Integer read FinventoryCode write FinventoryCode;
    property name : WideString read Fname write Fname;
    property incomeDate : TXSDate read FincomeDate write FincomeDate;
    property documentNumber : WideString read FdocumentNumber write FdocumentNumber;
    property originalValue : TXSDecimal read ForiginalValue write ForiginalValue;
    property usefulLife : Integer read FusefulLife write FusefulLife;
    property initial : TXSBoolean read Finitial write Finitial;
    property groupRef : RegulatoryAssetBaseGroupRef read FgroupRef write FgroupRef;
    property writeOffNumber : WideString read FwriteOffNumber write FwriteOffNumber;
    property writeOffDate : TXSDate read FwriteOffDate write FwriteOffDate;
    property investition : TXSBoolean read Finvestition write Finvestition;
    property investitionProgramName : WideString read FinvestitionProgramName write FinvestitionProgramName;
    property investitionProgramYear : Integer read FinvestitionProgramYear write FinvestitionProgramYear;
    property investitionProgramCipher : WideString read FinvestitionProgramCipher write FinvestitionProgramCipher;
    property connection : TXSBoolean read Fconnection write Fconnection;
    property connectionNumber : WideString read FconnectionNumber write FconnectionNumber;
    property connectionDate : TXSDate read FconnectionDate write FconnectionDate;
    property connectionContragent : WideString read FconnectionContragent write FconnectionContragent;
    property categoryCode : Integer read FcategoryCode write FcategoryCode;
    property parentRef : RegulatoryAssetBaseRef read FparentRef write FparentRef;
    property fundingSourceRef : RegulatoryAssetBaseFundingSourceRef read FfundingSourceRef write FfundingSourceRef;
  end;

  RegulatoryAssetBaseGroup = class(TRemotable)
  private
    Fcode : Integer;
    Fnumber : WideString;
    Fname : WideString;
    FusefulLife : Integer;
//???
    FparentRef : RegulatoryAssetBaseGroupRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property number : WideString read Fnumber write Fnumber;
    property name : WideString read Fname write Fname;
    property usefulLife : Integer read FusefulLife write FusefulLife;
    property parentRef : RegulatoryAssetBaseGroupRef read FparentRef write FparentRef;
  end;
  
  RegulatoryAssetBaseFundingSource = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

  RegulatoryAssetBasePartialWriteOff = class(TRemotable)
  private
    Fcode : Integer;
    FwriteOffNumber : WideString;
    FwriteOffDate : TXSDate;
    Fvalue : TXSDecimal;
    Fpercentage : TXSDecimal;
//???
    FassetRef : RegulatoryAssetBaseRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property writeOffNumber : WideString read FwriteOffNumber write FwriteOffNumber;
    property writeOffDate : TXSDate read FwriteOffDate write FwriteOffDate;
    property value : TXSDecimal read Fvalue write Fvalue;
    property percentage : TXSDecimal read Fpercentage write Fpercentage;
    property assetRef : RegulatoryAssetBaseRef read FassetRef write FassetRef;
  end;

  RegulatoryAssetBaseOutOfUse = class(TRemotable)
  private
    Fcode : Integer;
    FdateStart : TXSDate;
    FdateFinish : TXSDate;
//???
    FassetRef : RegulatoryAssetBaseRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinish : TXSDate read FdateFinish write FdateFinish;
    property assetRef : RegulatoryAssetBaseRef read FassetRef write FassetRef;
  end;

  RegulatoryAssetBaseCalculationShort = class(TRemotable)
  private
    Fcode : Integer;
    Fperiod : TXSDate;
    ForiginalValue : TXSDecimal;
    Fdepreciation : TXSDecimal;
    FresidualValue : TXSDecimal;
    FwrittenOffValue : TXSDecimal;
    FassetRefCode : Integer;
    FusefulLife : Integer;
    FassetRefInventoryNumber : WideString;
    FassetRefName : WideString;
    FassetRefIncomeDate : TXSDate;
    FassetRefDocumentNumber : WideString;
    FassetRefOriginalValue : TXSDecimal;
    FassetRefInitial : TXSBoolean;
    FassetRefUsefulLife : Integer;
    FassetRefGroupRefCode : Integer;
    FassetRefGroupRefNumber : WideString;
    FassetRefGroupRefName : WideString;
    FassetRefWriteOffNumber : WideString;
    FassetRefWriteOffDate : TXSDate;
    FassetRefInvestition : TXSBoolean;
    FassetRefInvestitionProgramName : WideString;
    FassetRefInvestitionProgramYear : Integer;
  	FassetRefInvestitionProgramCipher : WideString;
  	FassetRefConnection : TXSBoolean;
  	FassetRefConnectionNumber : WideString;
  	FassetRefConnectionDate : TXSDate;
  	FassetRefConnectionContragent : WideString;
  	FassetRefCategoryCode : Integer;
  	FassetRefParentRefCode : Integer;
  	FassetRefFundingSourceRefCode : Integer;
  	FassetRefFundingSourceRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property period : TXSDate read Fperiod write Fperiod;
    property originalValue : TXSDecimal read ForiginalValue write ForiginalValue;
    property depreciation : TXSDecimal read Fdepreciation write Fdepreciation;
    property residualValue : TXSDecimal read FresidualValue write FresidualValue;
    property writtenOffValue : TXSDecimal read FwrittenOffValue write FwrittenOffValue;
    property usefulLife : Integer read FusefulLife write FusefulLife;
    property assetRefCode : Integer read FassetRefCode write FassetRefCode;
    property assetRefInventoryNumber : WideString read FassetRefInventoryNumber write FassetRefInventoryNumber;
    property assetRefName : WideString read FassetRefName write FassetRefName;
    property assetRefIncomeDate : TXSDate read FassetRefIncomeDate write FassetRefIncomeDate;
    property assetRefDocumentNumber : WideString read FassetRefDocumentNumber write FassetRefDocumentNumber;
    property assetRefOriginalValue : TXSDecimal read FassetRefOriginalValue write FassetRefOriginalValue;
    property assetRefInitial : TXSBoolean read FassetRefInitial write FassetRefInitial;
    property assetRefGroupRefCode : Integer read FassetRefGroupRefCode write FassetRefGroupRefCode;
    property assetRefGroupRefNumber : WideString read FassetRefGroupRefNumber write FassetRefGroupRefNumber;
    property assetRefGroupRefName : WideString read FassetRefGroupRefName write FassetRefGroupRefName;
    property assetRefUsefulLife : Integer read FassetRefUsefulLife write FassetRefUsefulLife;
    property assetRefWriteOffNumber : WideString read FassetRefWriteOffNumber write FassetRefWriteOffNumber;
    property assetRefWriteOffDate : TXSDate read FassetRefWriteOffDate write FassetRefWriteOffDate;
	  property assetRefInvestition : TXSBoolean read FassetRefInvestition write FassetRefInvestition;
	  property assetRefInvestitionProgramName : WideString read FassetRefInvestitionProgramName write FassetRefInvestitionProgramName;
	  property assetRefInvestitionProgramYear : Integer read FassetRefInvestitionProgramYear write FassetRefInvestitionProgramYear;
	  property assetRefInvestitionProgramCipher : WideString read FassetRefInvestitionProgramCipher write FassetRefInvestitionProgramCipher;
	  property assetRefConnection : TXSBoolean read FassetRefConnection write FassetRefConnection;
	  property assetRefConnectionNumber : WideString read FassetRefConnectionNumber write FassetRefConnectionNumber;
	  property assetRefConnectionDate : TXSDate read FassetRefConnectionDate write FassetRefConnectionDate;
	  property assetRefConnectionContragent : WideString read FassetRefConnectionContragent write FassetRefConnectionContragent;
	  property assetRefCategoryCode : Integer read FassetRefCategoryCode write FassetRefCategoryCode;
	  property assetRefParentRefCode : Integer read FassetRefParentRefCode write FassetRefParentRefCode;
	  property assetRefFundingSourceRefCode : Integer read FassetRefFundingSourceRefCode write FassetRefFundingSourceRefCode;
	  property assetRefFundingSourceRefName : WideString read FassetRefFundingSourceRefName write FassetRefFundingSourceRefName;
  end;

  RegulatoryAssetBaseGroupShort = class(TRemotable)
  private
    Fcode : Integer;
    Fnumber : WideString;
    Fname : WideString;
    FparentRefCode : Integer;
    FparentRefNumber : WideString;
    FparentRefName : WideString;
    FhasChildren  : TXSBoolean;
    FusefulLife : Integer;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property number : WideString read Fnumber write Fnumber;
    property name : WideString read Fname write Fname;

    property parentRefCode : Integer read FparentRefCode write FparentRefCode;
    property parentRefNumber : WideString read FparentRefNumber write FparentRefNumber;
    property parentRefName : WideString read FparentRefName write FparentRefName;
    property hasChildren : TXSBoolean read FhasChildren write FhasChildren;
    property usefulLife : Integer read FusefulLife write FusefulLife;
  end;
  
  RegulatoryAssetBaseFundingSourceShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

  RegulatoryAssetBaseOutOfUseShort = class(TRemotable)
  private
    Fcode : Integer;
    FdateStart : TXSDate;
    FdateFinish : TXSDate;
    FassetRefCode : Integer;
    FassetRefInventoryNumber : WideString;
    FassetRefName : WideString;
    FassetRefIncomeDate : TXSDate;
    FassetRefOriginalValue : TXSDecimal;
    FassetRefInitial : TXSBoolean;
    FassetRefWriteOffDate : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinish : TXSDate read FdateFinish write FdateFinish;

    property assetRefCode : Integer read FassetRefCode write FassetRefCode;
    property assetRefInventoryNumber : WideString read FassetRefInventoryNumber write FassetRefInventoryNumber;
    property assetRefName : WideString read FassetRefName write FassetRefName;
    property assetRefIncomeDate : TXSDate read FassetRefIncomeDate write FassetRefIncomeDate;
    property assetRefOriginalValue : TXSDecimal read FassetRefOriginalValue write FassetRefOriginalValue;
    property assetRefInitial : TXSBoolean read FassetRefInitial write FassetRefInitial;
    property assetRefWriteOffDate : TXSDate read FassetRefWriteOffDate write FassetRefWriteOffDate;
  end;

  RegulatoryAssetBasePartialWriteOffShort = class(TRemotable)
  private
    Fcode : Integer;
    FwriteOffNumber : WideString;
    FwriteOffDate : TXSDate;
    Fvalue : TXSDecimal;
    Fpercentage : TXSDecimal;
    FassetRefCode : Integer;
    FassetRefInventoryNumber : WideString;
    FassetRefName : WideString;
    FassetRefIncomeDate : TXSDate;
    FassetRefOriginalValue : TXSDecimal;
    FassetRefInitial : TXSBoolean;
    FassetRefwriteOffNumber : WideString;
    FassetRefWriteOffDate : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property writeOffDate : TXSDate read FwriteOffDate write FwriteOffDate;
    property value : TXSDecimal read Fvalue write Fvalue;
    property percentage : TXSDecimal read Fpercentage write Fpercentage;

    property assetRefCode : Integer read FassetRefCode write FassetRefCode;
    property assetRefInventoryNumber : WideString read FassetRefInventoryNumber write FassetRefInventoryNumber;
    property assetRefName : WideString read FassetRefName write FassetRefName;
    property assetRefIncomeDate : TXSDate read FassetRefIncomeDate write FassetRefIncomeDate;
    property assetRefOriginalValue : TXSDecimal read FassetRefOriginalValue write FassetRefOriginalValue;
    property assetRefInitial : TXSBoolean read FassetRefInitial write FassetRefInitial;
    property assetRefWriteOffNumber : WideString read FassetRefwriteOffNumber write FassetRefwriteOffNumber;
    property assetRefWriteOffDate : TXSDate read FassetRefWriteOffDate write FassetRefWriteOffDate;
  end;

  ArrayOfRegulatoryAssetBase = array of RegulatoryAssetBase;
  ArrayOfRegulatoryAssetBaseCalculationShort = array of RegulatoryAssetBaseCalculationShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }
  ArrayOfRegulatoryAssetBaseGroupShort = array of RegulatoryAssetBaseGroupShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }
  ArrayOfRegulatoryAssetBaseFundingSourceShort = array of RegulatoryAssetBaseFundingSourceShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }
  ArrayOfRegulatoryAssetBasePartialWriteOffShort = array of RegulatoryAssetBasePartialWriteOffShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }
  ArrayOfRegulatoryAssetBaseOutOfUseShort = array of RegulatoryAssetBaseOutOfUseShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }
  ArrayOfRegulatoryAssetBasePartialWriteOff = array of RegulatoryAssetBasePartialWriteOff;  // { "http://ksoe.org/EnergyproControllerService/type/" }


  RegulatoryAssetBaseFilter = class(RegulatoryAssetBase)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;

    FincomeDateFrom : TXSDate;
    FincomeDateTo : TXSDate;
    ForiginalValueFrom : TXSDecimal;
    ForiginalValueTo : TXSDecimal;
    FusefulLifeFrom : Integer;
    FusefulLifeTo : Integer;
    FwriteOffDateFrom : TXSDate;
    FwriteOffDateTo : TXSDate;
    FinvestitionProgramYearFrom : Integer;
    FinvestitionProgramYearTo : Integer;
    FconnectionDateFrom : TXSDate;
    FconnectionDateTo : TXSDate;
    FcodeFrom : Integer;
    FcodeTo : Integer;
    FgroupsList : ArrayOfRegulatoryAssetBaseGroupShort;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;

    property incomeDateFrom : TXSDate read FincomeDateFrom write FincomeDateFrom;
    property incomeDateTo : TXSDate read FincomeDateTo write FincomeDateTo;
    property originalValueFrom : TXSDecimal read ForiginalValueFrom write ForiginalValueFrom;
    property originalValueTo : TXSDecimal read ForiginalValueTo write ForiginalValueTo;
    property usefulLifeFrom : Integer read FusefulLifeFrom write FusefulLifeFrom;
    property usefulLifeTo : Integer read FusefulLifeTo write FusefulLifeTo;
    property writeOffDateFrom : TXSDate read FwriteOffDateFrom write FwriteOffDateFrom;
    property writeOffDateTo : TXSDate read FwriteOffDateTo write FwriteOffDateTo;
    property investitionProgramYearFrom : Integer read FinvestitionProgramYearFrom write FinvestitionProgramYearFrom;
    property investitionProgramYearTo : Integer read FinvestitionProgramYearTo write FinvestitionProgramYearTo;
    property groupsList : ArrayOfRegulatoryAssetBaseGroupShort read FgroupsList write FgroupsList;
    property connectionDateFrom : TXSDate read FconnectionDateFrom write FconnectionDateFrom;
    property connectionDateTo : TXSDate read FconnectionDateTo write FconnectionDateTo;
    property codeFrom : Integer read FcodeFrom write FcodeFrom;
    property codeTo : Integer read FcodeTo write FcodeTo;
  end;

  RegulatoryAssetBasePartialWriteOffFilter = class(RegulatoryAssetBasePartialWriteOff)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    FpercentageFrom : TXSDecimal;
    FpercentageTo : TXSDecimal;
    FvalueFrom : TXSDecimal;
    FvalueTo : TXSDecimal;
    FwriteOffDateFrom : TXSDate;
    FwriteOffDateTo : TXSDate;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property percentageFrom : TXSDecimal read FpercentageFrom write FpercentageFrom;
    property percentageTo : TXSDecimal read FpercentageTo write FpercentageTo;
    property valueFrom : TXSDecimal read FvalueFrom write FvalueFrom;
    property valueTo : TXSDecimal read FvalueTo write FvalueTo;
    property writeOffDateFrom : TXSDate read FwriteOffDateFrom write FwriteOffDateFrom;
    property writeOffDateTo : TXSDate read FwriteOffDateTo write FwriteOffDateTo;
  end;

  RegulatoryAssetBaseCalculationFilter = class(RegulatoryAssetBaseCalculation)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    FassetFilter : RegulatoryAssetBaseFilter;
    FpartialWriteOffFilter : RegulatoryAssetBasePartialWriteOffFilter;
    ForiginalValueFrom : TXSDecimal;
    ForiginalValueTo : TXSDecimal;
    FdepreciationFrom : TXSDecimal;
    FdepreciationTo : TXSDecimal;
    FresidualValueFrom : TXSDecimal;
    FresidualValueTo : TXSDecimal;
    FwrittenOffValueFrom : TXSDecimal;
    FwrittenOffValueTo : TXSDecimal;
    FusefulLifeFrom : Integer;
    FusefulLifeTo : Integer;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property assetFilter: RegulatoryAssetBaseFilter read FassetFilter write FassetFilter;
    property partialWriteOffFilter: RegulatoryAssetBasePartialWriteOffFilter read FpartialWriteOffFilter write FpartialWriteOffFilter;
    property originalValueFrom : TXSDecimal read ForiginalValueFrom write ForiginalValueFrom;
    property originalValueTo : TXSDecimal read ForiginalValueTo write ForiginalValueTo;
    property depreciationFrom : TXSDecimal read FdepreciationFrom write FdepreciationFrom;
    property depreciationTo : TXSDecimal read FdepreciationTo write FdepreciationTo;
    property residualValueFrom : TXSDecimal read FresidualValueFrom write FresidualValueFrom;
    property residualValueTo : TXSDecimal read FresidualValueTo write FresidualValueTo;
    property writtenOffValueFrom : TXSDecimal read FwrittenOffValueFrom write FwrittenOffValueFrom;
    property writtenOffValueTo : TXSDecimal read FwrittenOffValueTo write FwrittenOffValueTo;
    property usefulLifeFrom : Integer read FusefulLifeFrom write FusefulLifeFrom;
    property usefulLifeTo : Integer read FusefulLifeTo write FusefulLifeTo;
  end;

  RegulatoryAssetBaseGroupFilter = class(RegulatoryAssetBaseGroup)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  RegulatoryAssetBaseFundingSourceFilter = class(RegulatoryAssetBaseFundingSource)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RegulatoryAssetBaseOutOfUseFilter = class(RegulatoryAssetBaseOutOfUse)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RegulatoryAssetBaseCalculationShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRegulatoryAssetBaseCalculationShort;
    FsummaryValues : RegulatoryAssetBaseCalculationShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRegulatoryAssetBaseCalculationShort read Flist write Flist;
    property summaryValues : RegulatoryAssetBaseCalculationShort read FsummaryValues write FsummaryValues;
  end;

  RegulatoryAssetBaseGroupShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRegulatoryAssetBaseGroupShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRegulatoryAssetBaseGroupShort read Flist write Flist;
  end;
  
  RegulatoryAssetBaseFundingSourceShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRegulatoryAssetBaseFundingSourceShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRegulatoryAssetBaseFundingSourceShort read Flist write Flist;
  end;

  RegulatoryAssetBasePartialWriteOffShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRegulatoryAssetBasePartialWriteOffShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRegulatoryAssetBasePartialWriteOffShort read Flist write Flist;
  end;

  RegulatoryAssetBaseOutOfUseShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRegulatoryAssetBaseOutOfUseShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRegulatoryAssetBaseOutOfUseShort read Flist write Flist;
  end;

  RegulatoryAssetBaseSynchronizationData = class(TRemotable)
  private
    FincomeAssets: ArrayOfRegulatoryAssetBase;
    FcompletelyWrittenOffAssets: ArrayOfRegulatoryAssetBase;
    FpartialWriteOffs: ArrayOfRegulatoryAssetBasePartialWriteOff;
  public
  destructor Destroy; override;
  published
    property incomeAssets: ArrayOfRegulatoryAssetBase read FincomeAssets write FincomeAssets;
    property completelyWrittenOffAssets: ArrayOfRegulatoryAssetBase read FcompletelyWrittenOffAssets write FcompletelyWrittenOffAssets;
    property partialWriteOffs : ArrayOfRegulatoryAssetBasePartialWriteOff read FpartialWriteOffs write FpartialWriteOffs;
  end;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RegulatoryAssetBaseCalculationController/message/
  // soapAction: http://ksoe.org/RegulatoryAssetBaseCalculationController/action/RegulatoryAssetBaseCalculationController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RegulatoryAssetBaseCalculationControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RegulatoryAssetBaseCalculationController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RegulatoryAssetBaseCalculationControllerSoapPort = interface(IInvokable)
  ['{90718494-0C58-4659-9A7F-00FD841BFDBF}']
    function add(const aRegulatoryAssetBaseCalculation: RegulatoryAssetBaseCalculation): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRegulatoryAssetBaseCalculation: RegulatoryAssetBaseCalculation); stdcall;
    function getObject(const anObjectCode: Integer): RegulatoryAssetBaseCalculation; stdcall;
    function getList: RegulatoryAssetBaseCalculationShortList; stdcall;
    function getFilteredList(const aRegulatoryAssetBaseCalculationFilter: RegulatoryAssetBaseCalculationFilter): RegulatoryAssetBaseCalculationShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RegulatoryAssetBaseCalculationShortList; stdcall;
    function getScrollableFilteredList(const aRegulatoryAssetBaseCalculationFilter: RegulatoryAssetBaseCalculationFilter; const aFromPosition: Integer; const aQuantity: Integer): RegulatoryAssetBaseCalculationShortList; stdcall;
    function getScrollableFilteredListOfGroups(const aRegulatoryAssetBaseGroupFilter: RegulatoryAssetBaseGroupFilter; const aFromPosition: Integer; const aQuantity: Integer): RegulatoryAssetBaseGroupShortList; stdcall;
    function getScrollableFilteredListOfFundingSources(const aRegulatoryAssetBaseFundingSourceFilter: RegulatoryAssetBaseFundingSourceFilter; const aFromPosition: Integer; const aQuantity: Integer): RegulatoryAssetBaseFundingSourceShortList; stdcall;
    function getGroup(const anObjectCode: Integer) : RegulatoryAssetBaseGroup; stdcall;
    function getFundingSource(const anObjectCode: Integer) : RegulatoryAssetBaseFundingSource; stdcall;
    function getListOnPeriod(const aRegulatoryAssetBaseCalculationFilter: RegulatoryAssetBaseCalculationFilter; periodTo : TXSDate;
		  const aFromPosition: Integer; const aQuantity: Integer): RegulatoryAssetBaseCalculationShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RegulatoryAssetBaseCalculationShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRegulatoryAssetBaseCalculationFilter: RegulatoryAssetBaseCalculationFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RegulatoryAssetBaseCalculationShort; stdcall;
    function getShortObjectOnPeriod(const asset : RegulatoryAssetBase; const period : TXSDate): RegulatoryAssetBaseCalculationShort; stdcall;
    procedure calculate(period : TXSDate); stdcall;
    function setFilter(filter : RegulatoryAssetBaseCalculationFilter) : Int64; stdcall;
    function getFilter(id : Int64) : RegulatoryAssetBaseCalculationFilter; stdcall;

    function getAsset(const anObjectCode: Integer) : RegulatoryAssetBase; stdcall;
    function addAsset(const aRegulatoryAssetBase: RegulatoryAssetBase): Integer; stdcall;
    procedure removeAsset(const anObjectCode: Integer); stdcall;
    procedure saveAsset(const aRegulatoryAssetBase: RegulatoryAssetBase); stdcall;

    function getOutOfUse(const anObjectCode: Integer): RegulatoryAssetBaseOutOfUse; stdcall;
    function getListOfOutOfUse(const aRegulatoryAssetBaseOutOfUseFilter: RegulatoryAssetBaseOutOfUseFilter;
      const aFromPosition: Integer; const aQuantity: Integer): RegulatoryAssetBaseOutOfUseShortList; stdcall;
    function addOutOfUse(const aRegulatoryAssetBaseOutOfUse: RegulatoryAssetBaseOutOfUse): Integer; stdcall;
    procedure removeOutOfUse(const anObjectCode: Integer); stdcall;
    procedure saveOutOfUse(const aRegulatoryAssetBaseOutOfUse: RegulatoryAssetBaseOutOfUse); stdcall;

    function getPartialWriteOff(const anObjectCode: Integer): RegulatoryAssetBasePartialWriteOff; stdcall;
    function getListOfPartialWriteOff(const aRegulatoryAssetBasePartialWriteOffFilter: RegulatoryAssetBasePartialWriteOffFilter;
      const aFromPosition: Integer; const aQuantity: Integer): RegulatoryAssetBasePartialWriteOffShortList; stdcall;
    function addPartialWriteOff(const aRegulatoryAssetBasePartialWriteOff: RegulatoryAssetBasePartialWriteOff): Integer; stdcall;
    procedure removePartialWriteOff(const anObjectCode: Integer); stdcall;
    procedure savePartialWriteOff(const aRegulatoryAssetBasePartialWriteOff: RegulatoryAssetBasePartialWriteOff); stdcall;

    function getDataForSynchronization(const startPeriod : TXSDate; const finishPeriod : TXSDate) : RegulatoryAssetBaseSynchronizationData; stdcall;
    procedure synchronize(data : RegulatoryAssetBaseSynchronizationData); stdcall;
  end;

implementation

  destructor RegulatoryAssetBaseCalculation.Destroy;
  begin
    if Assigned(Fperiod) then
      period.Free;
    if Assigned(ForiginalValue) then
      originalValue.Free;
    if Assigned(Fdepreciation) then
      depreciation.Free;
    if Assigned(FresidualValue) then
      residualValue.Free;
    if Assigned(FwrittenOffValue) then
      writtenOffValue.Free;
    if Assigned(FassetRef) then
      assetRef.Free;
    inherited Destroy;
  end;

  destructor RegulatoryAssetBaseCalculationFilter.Destroy;
  begin
    if Assigned(FassetFilter) then assetFilter.Destroy;
    if Assigned(FpartialWriteOffFilter) then partialWriteOffFilter.Destroy;

    inherited Destroy;
  end;

  destructor RegulatoryAssetBaseCalculationShort.Destroy;
  begin
    if Assigned(Fperiod) then
      period.Free;
    if Assigned(ForiginalValue) then
      originalValue.Free;
    if Assigned(Fdepreciation) then
      depreciation.Free;
    if Assigned(FresidualValue) then
      residualValue.Free;
      if Assigned(FwrittenOffValue) then
      writtenOffValue.Free;
    if Assigned(FassetRefIncomeDate) then
      assetRefIncomeDate.Free;
    if Assigned(FassetRefOriginalValue) then
      assetRefOriginalValue.Free;
    if Assigned(FassetRefWriteOffDate) then
      assetRefWriteOffDate.Free;
    if Assigned(FassetRefInvestition) then
      assetRefInvestition.Free;
    if Assigned(FassetRefConnection) then
      assetRefConnection.Free;
    if Assigned(FassetRefConnectionDate) then
      assetRefConnectionDate.Free;
    inherited Destroy;
  end;

  destructor RegulatoryAssetBaseCalculationShortList.Destroy;
  var
    I: Integer;
  begin
    for I := 0 to Length(Flist)-1 do
     if Assigned(Flist[I]) then
       Flist[I].Free;
     SetLength(Flist, 0);
     inherited Destroy;
  end;

  destructor RegulatoryAssetBase.Destroy;
  begin
    if Assigned(FincomeDate) then
      incomeDate.Free;
    if Assigned(ForiginalValue) then
      originalValue.Free;
    if Assigned(Finitial) then
      initial.Free;
    if Assigned(FgroupRef) then
      groupRef.Free;
    if Assigned(FwriteOffDate) then
      writeOffDate.Free;
    if Assigned(Finvestition) then
      investition.Free;
    if Assigned(Fconnection) then
      connection.Free;
    if Assigned(FconnectionDate) then
      connectionDate.Free;
    if Assigned(FparentRef) then
      parentRef.Free;
    if Assigned(FgroupRef) then
      groupRef.Free;
    if Assigned(FfundingSourceRef) then
      fundingSourceRef.Free;
    inherited Destroy;
  end;

  destructor RegulatoryAssetBaseFilter.Destroy;
  var I : Integer;
  begin
    if Assigned(FincomeDateFrom) then incomeDateFrom.Free;
    if Assigned(FincomeDateTo) then incomeDateTo.Free;
    if Assigned(ForiginalValueFrom) then originalValueFrom.Free;
    if Assigned(ForiginalValueTo) then originalValueTo.Free;
    if Assigned(FwriteOffDateFrom) then writeOffDateFrom.Free;
    if Assigned(FwriteOffDateTo) then writeOffDateTo.Free;
    for I := 0 to Length(FgroupsList)-1 do
     if Assigned(FgroupsList[I]) then FgroupsList[I].Free;
     SetLength(FgroupsList, 0);
    inherited Destroy;
  end;

  destructor RegulatoryAssetBaseGroup.Destroy;
  begin
    if Assigned(FparentRef) then
      parentRef.Free;
    inherited Destroy;
  end;

  destructor RegulatoryAssetBaseGroupFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RegulatoryAssetBaseGroupShort.Destroy;
  begin
    if Assigned(FhasChildren) then hasChildren.Free;
    inherited Destroy;
  end;

  destructor RegulatoryAssetBaseGroupShortList.Destroy;
  var
    I: Integer;
  begin
    for I := 0 to Length(Flist)-1 do
     if Assigned(Flist[I]) then
       Flist[I].Free;
     SetLength(Flist, 0);
     inherited Destroy;
  end;
  
  destructor RegulatoryAssetBaseFundingSource.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RegulatoryAssetBaseFundingSourceFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RegulatoryAssetBaseFundingSourceShort.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RegulatoryAssetBaseFundingSourceShortList.Destroy;
  var
    I: Integer;
  begin
    for I := 0 to Length(Flist)-1 do
     if Assigned(Flist[I]) then
       Flist[I].Free;
     SetLength(Flist, 0);
     inherited Destroy;
  end;

  destructor RegulatoryAssetBaseOutOfUse.Destroy;
  begin
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinish) then
      dateFinish.Free;
    if Assigned(FassetRef) then
      assetRef.Free;
    inherited Destroy;
  end;

  destructor RegulatoryAssetBaseOutOfUseFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RegulatoryAssetBaseOutOfUseShort.Destroy;
  begin
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinish) then
      dateFinish.Free;
    if Assigned(FassetRefIncomeDate) then
      assetRefIncomeDate.Free;
    if Assigned(FassetRefOriginalValue) then
      assetRefOriginalValue.Free;
    if Assigned(FassetRefWriteOffDate) then
      assetRefWriteOffDate.Free;
    inherited Destroy;
  end;

  destructor RegulatoryAssetBaseOutOfUseShortList.Destroy;
  var
    I: Integer;
  begin
    for I := 0 to Length(Flist)-1 do
     if Assigned(Flist[I]) then
       Flist[I].Free;
     SetLength(Flist, 0);
     inherited Destroy;
  end;

  destructor RegulatoryAssetBasePartialWriteOff.Destroy;
  begin
    if Assigned(FwriteOffDate) then
      writeOffDate.Free;
    if Assigned(Fvalue) then
      value.Free;
    if Assigned(Fpercentage) then
      percentage.Free;
    if Assigned(FassetRef) then
      assetRef.Free;
    inherited Destroy;
  end;


  destructor RegulatoryAssetBasePartialWriteOffFilter.Destroy;
  begin
    if Assigned(FpercentageFrom) then percentageFrom.Free;
    if Assigned(FpercentageTo) then percentageTo.Free;
    if Assigned(FvalueFrom) then valueFrom.Free;
    if Assigned(FvalueTo) then valueTo.Free;
    if Assigned(FwriteOffDateFrom) then writeOffDateFrom.Free;
    if Assigned(FwriteOffDateTo) then writeOffDateTo.Free;

    inherited Destroy;
  end;

  destructor RegulatoryAssetBasePartialWriteOffShort.Destroy;
  begin
    if Assigned(FwriteOffDate) then
      writeOffDate.Free;
    if Assigned(Fvalue) then
      value.Free;
    if Assigned(Fpercentage) then
      percentage.Free;
    if Assigned(FassetRefIncomeDate) then
      assetRefIncomeDate.Free;
    if Assigned(FassetRefOriginalValue) then
      assetRefOriginalValue.Free;
    if Assigned(FassetRefWriteOffDate) then
      assetRefWriteOffDate.Free;
    inherited Destroy;
  end;

  destructor RegulatoryAssetBasePartialWriteOffShortList.Destroy;
  var
    I: Integer;
  begin
    for I := 0 to Length(Flist)-1 do
     if Assigned(Flist[I]) then
       Flist[I].Free;
     SetLength(Flist, 0);
     inherited Destroy;
  end;

  destructor RegulatoryAssetBaseSynchronizationData.Destroy;
  var i : Integer;
  begin
    if(Assigned(Self.FincomeAssets)) then begin
      for i := 0 to Length(Self.FincomeAssets) - 1 do
        if Assigned(Self.FincomeAssets[i]) then
          Self.FincomeAssets[i].Destroy;
      SetLength(Self.FincomeAssets, 0);
    end;
    if(Assigned(Self.FcompletelyWrittenOffAssets)) then begin
      for i := 0 to Length(Self.FcompletelyWrittenOffAssets) - 1 do
        if Assigned(Self.FcompletelyWrittenOffAssets[i]) then
          Self.FcompletelyWrittenOffAssets[i].Destroy;
      SetLength(Self.FcompletelyWrittenOffAssets, 0);
    end;
    if(Assigned(Self.FpartialWriteOffs)) then begin
      for i := 0 to Length(Self.FpartialWriteOffs) - 1 do
        if Assigned(Self.FpartialWriteOffs[i]) then
          Self.FpartialWriteOffs[i].Destroy;
      SetLength(Self.FpartialWriteOffs, 0);
    end;
    inherited Destroy;
  end;


initialization

  RemClassRegistry.RegisterXSClass(RegulatoryAssetBaseCalculation, 'http://ksoe.org/EnergyproControllerService/type/', 'RegulatoryAssetBaseCalculation');
  RemClassRegistry.RegisterXSClass(RegulatoryAssetBaseCalculationRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RegulatoryAssetBaseCalculationRef');
  RemClassRegistry.RegisterXSClass(RegulatoryAssetBaseCalculationFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RegulatoryAssetBaseCalculationFilter');
  RemClassRegistry.RegisterXSClass(RegulatoryAssetBaseCalculationShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RegulatoryAssetBaseCalculationShort');
  RemClassRegistry.RegisterXSClass(RegulatoryAssetBaseCalculationShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RegulatoryAssetBaseCalculationShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRegulatoryAssetBaseCalculationShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRegulatoryAssetBaseCalculationShort');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRegulatoryAssetBase), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRegulatoryAssetBase');
  RemClassRegistry.RegisterXSClass(RegulatoryAssetBase, 'http://ksoe.org/EnergyproControllerService/type/', 'RegulatoryAssetBase');
  RemClassRegistry.RegisterXSClass(RegulatoryAssetBaseRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RegulatoryAssetBaseRef');
  RemClassRegistry.RegisterXSClass(RegulatoryAssetBaseFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RegulatoryAssetBaseFilter');
  RemClassRegistry.RegisterXSClass(RegulatoryAssetBaseGroupRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RegulatoryAssetBaseGroupRef');
  RemClassRegistry.RegisterXSClass(RegulatoryAssetBaseGroupFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RegulatoryAssetBaseGroupFilter');
  RemClassRegistry.RegisterXSClass(RegulatoryAssetBaseGroupShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RegulatoryAssetBaseGroupShort');
  RemClassRegistry.RegisterXSClass(RegulatoryAssetBaseFundingSourceRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RegulatoryAssetBaseFundingSourceRef');
  RemClassRegistry.RegisterXSClass(RegulatoryAssetBaseFundingSourceFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RegulatoryAssetBaseFundingSourceFilter');
  RemClassRegistry.RegisterXSClass(RegulatoryAssetBaseFundingSourceShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RegulatoryAssetBaseFundingSourceShort');
  RemClassRegistry.RegisterXSClass(RegulatoryAssetBaseGroupShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RegulatoryAssetBaseGroupShortList');
  RemClassRegistry.RegisterXSClass(RegulatoryAssetBasePartialWriteOff, 'http://ksoe.org/EnergyproControllerService/type/', 'RegulatoryAssetBasePartialWriteOff');
  RemClassRegistry.RegisterXSClass(RegulatoryAssetBasePartialWriteOffFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RegulatoryAssetBasePartialWriteOffFilter');
  RemClassRegistry.RegisterXSClass(RegulatoryAssetBasePartialWriteOffShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RegulatoryAssetBasePartialWriteOffShort');
  RemClassRegistry.RegisterXSClass(RegulatoryAssetBasePartialWriteOffShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RegulatoryAssetBasePartialWriteOffShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRegulatoryAssetBasePartialWriteOffShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRegulatoryAssetBasePartialWriteOffShort');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRegulatoryAssetBasePartialWriteOff), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRegulatoryAssetBasePartialWriteOff');
  RemClassRegistry.RegisterXSClass(RegulatoryAssetBaseOutOfUse, 'http://ksoe.org/EnergyproControllerService/type/', 'RegulatoryAssetBaseOutOfUse');
  RemClassRegistry.RegisterXSClass(RegulatoryAssetBaseOutOfUseFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RegulatoryAssetBaseOutOfUseFilter');
  RemClassRegistry.RegisterXSClass(RegulatoryAssetBaseOutOfUseShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RegulatoryAssetBaseOutOfUseShort');
  RemClassRegistry.RegisterXSClass(RegulatoryAssetBaseOutOfUseShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RegulatoryAssetBaseOutOfUseShortList');
  RemClassRegistry.RegisterXSClass(RegulatoryAssetBaseSynchronizationData, 'http://ksoe.org/EnergyproControllerService/type/', 'RegulatoryAssetBaseSynchronizationData');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRegulatoryAssetBaseOutOfUseShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRegulatoryAssetBaseOutOfUseShort');
  InvRegistry.RegisterInterface(TypeInfo(RegulatoryAssetBaseCalculationControllerSoapPort), 'http://ksoe.org/RegulatoryAssetBaseCalculationController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RegulatoryAssetBaseCalculationControllerSoapPort), 'http://ksoe.org/RegulatoryAssetBaseCalculationController/action/RegulatoryAssetBaseCalculationController.%operationName%');
end.
