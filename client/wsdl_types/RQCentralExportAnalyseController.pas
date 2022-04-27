unit RQCentralExportAnalyseController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
 , ENPlanWorkController ;

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

  RQCentralExportAnalyse            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQCentralExportAnalyseRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQCentralExportAnalyse = class(TRemotable)
  private
    Fcode : Integer;
    FdateStart : WideString;
    Fdif_Aparat : TXSDecimal;
    Fcause_Aparat : Integer;
    Fcentral_Export_Aparat : Integer;
    Fdif_Visokop : TXSDecimal;
    Fcause_Visokop : Integer;
    Fcentral_Export_Visokop : Integer;
    Fdif_Vlepetih : TXSDecimal;
    Fcause_Vlepetih : Integer;
    Fcentral_Export_Vlepetih : Integer;
    Fdif_Genichesk : TXSDecimal;
    Fcause_Genichesk : Integer;
    Fcentral_Export_Genichesk : Integer;
    Fdif_Gpristan : TXSDecimal;
    Fcause_Gpristan : Integer;
    Fcentral_Export_Gpristan : Integer;
    Fdif_Ivanovka : TXSDecimal;
    Fcause_Ivanovka : Integer;
    Fcentral_Export_Ivanovka : Integer;
    Fdif_Kahovka : TXSDecimal;
    Fcause_Kahovka : Integer;
    Fcentral_Export_Kahovka : Integer;
    Fdif_Nkahovka : TXSDecimal;
    Fcause_Nkahovka : Integer;
    Fcentral_Export_Nkahovka : Integer;
    Fdif_Ntroick : TXSDecimal;
    Fcause_Ntroick : Integer;
    Fcentral_Export_Ntroick : Integer;
    Fdif_Skadovsk : TXSDecimal;
    Fcause_Skadovsk : Integer;
    Fcentral_Export_Skadovsk : Integer;
    Fdif_Hmve : TXSDecimal;
    Fcause_Hmve : Integer;
    Fcentral_Export_Hmve : Integer;
    Fdif_Hmem : TXSDecimal;
    Fcause_Hmem : Integer;
    Fcentral_Export_Hmem : Integer;
    Fdif_Curup : TXSDecimal;
    Fcause_Curup : Integer;
    Fcentral_Export_Curup : Integer;
    Fdif_Chaplinka : TXSDecimal;
    Fcause_Chaplinka : Integer;
    Fcentral_Export_Chaplinka : Integer;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property dateStart : WideString read FdateStart write FdateStart;
    property dif_Aparat : TXSDecimal read Fdif_Aparat write Fdif_Aparat;
    property  cause_Aparat : Integer read Fcause_Aparat write Fcause_Aparat;
    property  central_Export_Aparat : Integer read Fcentral_Export_Aparat write Fcentral_Export_Aparat;
    property dif_Visokop : TXSDecimal read Fdif_Visokop write Fdif_Visokop;
    property  cause_Visokop : Integer read Fcause_Visokop write Fcause_Visokop;
    property  central_Export_Visokop : Integer read Fcentral_Export_Visokop write Fcentral_Export_Visokop;
    property dif_Vlepetih : TXSDecimal read Fdif_Vlepetih write Fdif_Vlepetih;
    property  cause_Vlepetih : Integer read Fcause_Vlepetih write Fcause_Vlepetih;
    property  central_Export_Vlepetih : Integer read Fcentral_Export_Vlepetih write Fcentral_Export_Vlepetih;
    property dif_Genichesk : TXSDecimal read Fdif_Genichesk write Fdif_Genichesk;
    property  cause_Genichesk : Integer read Fcause_Genichesk write Fcause_Genichesk;
    property  central_Export_Genichesk : Integer read Fcentral_Export_Genichesk write Fcentral_Export_Genichesk;
    property dif_Gpristan : TXSDecimal read Fdif_Gpristan write Fdif_Gpristan;
    property  cause_Gpristan : Integer read Fcause_Gpristan write Fcause_Gpristan;
    property  central_Export_Gpristan : Integer read Fcentral_Export_Gpristan write Fcentral_Export_Gpristan;
    property dif_Ivanovka : TXSDecimal read Fdif_Ivanovka write Fdif_Ivanovka;
    property  cause_Ivanovka : Integer read Fcause_Ivanovka write Fcause_Ivanovka;
    property  central_Export_Ivanovka : Integer read Fcentral_Export_Ivanovka write Fcentral_Export_Ivanovka;
    property dif_Kahovka : TXSDecimal read Fdif_Kahovka write Fdif_Kahovka;
    property  cause_Kahovka : Integer read Fcause_Kahovka write Fcause_Kahovka;
    property  central_Export_Kahovka : Integer read Fcentral_Export_Kahovka write Fcentral_Export_Kahovka;
    property dif_Nkahovka : TXSDecimal read Fdif_Nkahovka write Fdif_Nkahovka;
    property  cause_Nkahovka : Integer read Fcause_Nkahovka write Fcause_Nkahovka;
    property  central_Export_Nkahovka : Integer read Fcentral_Export_Nkahovka write Fcentral_Export_Nkahovka;
    property dif_Ntroick : TXSDecimal read Fdif_Ntroick write Fdif_Ntroick;
    property  cause_Ntroick : Integer read Fcause_Ntroick write Fcause_Ntroick;
    property  central_Export_Ntroick : Integer read Fcentral_Export_Ntroick write Fcentral_Export_Ntroick;
    property dif_Skadovsk : TXSDecimal read Fdif_Skadovsk write Fdif_Skadovsk;
    property  cause_Skadovsk : Integer read Fcause_Skadovsk write Fcause_Skadovsk;
    property  central_Export_Skadovsk : Integer read Fcentral_Export_Skadovsk write Fcentral_Export_Skadovsk;
    property dif_Hmve : TXSDecimal read Fdif_Hmve write Fdif_Hmve;
    property  cause_Hmve : Integer read Fcause_Hmve write Fcause_Hmve;
    property  central_Export_Hmve : Integer read Fcentral_Export_Hmve write Fcentral_Export_Hmve;
    property dif_Hmem : TXSDecimal read Fdif_Hmem write Fdif_Hmem;
    property  cause_Hmem : Integer read Fcause_Hmem write Fcause_Hmem;
    property  central_Export_Hmem : Integer read Fcentral_Export_Hmem write Fcentral_Export_Hmem;
    property dif_Curup : TXSDecimal read Fdif_Curup write Fdif_Curup;
    property  cause_Curup : Integer read Fcause_Curup write Fcause_Curup;
    property  central_Export_Curup : Integer read Fcentral_Export_Curup write Fcentral_Export_Curup;
    property dif_Chaplinka : TXSDecimal read Fdif_Chaplinka write Fdif_Chaplinka;
    property  cause_Chaplinka : Integer read Fcause_Chaplinka write Fcause_Chaplinka;
    property  central_Export_Chaplinka : Integer read Fcentral_Export_Chaplinka write Fcentral_Export_Chaplinka;
  end;

{
  RQCentralExportAnalyseFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FdateStart : WideString;
    Fdif_Aparat : TXSDecimal;
    Fcause_Aparat : Integer;
    Fcentral_Export_Aparat : Integer;
    Fdif_Visokop : TXSDecimal;
    Fcause_Visokop : Integer;
    Fcentral_Export_Visokop : Integer;
    Fdif_Vlepetih : TXSDecimal;
    Fcause_Vlepetih : Integer;
    Fcentral_Export_Vlepetih : Integer;
    Fdif_Genichesk : TXSDecimal;
    Fcause_Genichesk : Integer;
    Fcentral_Export_Genichesk : Integer;
    Fdif_Gpristan : TXSDecimal;
    Fcause_Gpristan : Integer;
    Fcentral_Export_Gpristan : Integer;
    Fdif_Ivanovka : TXSDecimal;
    Fcause_Ivanovka : Integer;
    Fcentral_Export_Ivanovka : Integer;
    Fdif_Kahovka : TXSDecimal;
    Fcause_Kahovka : Integer;
    Fcentral_Export_Kahovka : Integer;
    Fdif_Nkahovka : TXSDecimal;
    Fcause_Nkahovka : Integer;
    Fcentral_Export_Nkahovka : Integer;
    Fdif_Ntroick : TXSDecimal;
    Fcause_Ntroick : Integer;
    Fcentral_Export_Ntroick : Integer;
    Fdif_Skadovsk : TXSDecimal;
    Fcause_Skadovsk : Integer;
    Fcentral_Export_Skadovsk : Integer;
    Fdif_Hmve : TXSDecimal;
    Fcause_Hmve : Integer;
    Fcentral_Export_Hmve : Integer;
    Fdif_Hmem : TXSDecimal;
    Fcause_Hmem : Integer;
    Fcentral_Export_Hmem : Integer;
    Fdif_Curup : TXSDecimal;
    Fcause_Curup : Integer;
    Fcentral_Export_Curup : Integer;
    Fdif_Chaplinka : TXSDecimal;
    Fcause_Chaplinka : Integer;
    Fcentral_Export_Chaplinka : Integer;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property dateStart : WideString read FdateStart write FdateStart;
    property dif_Aparat : TXSDecimal read Fdif_Aparat write Fdif_Aparat;
    property  cause_Aparat : Integer read Fcause_Aparat write Fcause_Aparat;
    property  central_Export_Aparat : Integer read Fcentral_Export_Aparat write Fcentral_Export_Aparat;
    property dif_Visokop : TXSDecimal read Fdif_Visokop write Fdif_Visokop;
    property  cause_Visokop : Integer read Fcause_Visokop write Fcause_Visokop;
    property  central_Export_Visokop : Integer read Fcentral_Export_Visokop write Fcentral_Export_Visokop;
    property dif_Vlepetih : TXSDecimal read Fdif_Vlepetih write Fdif_Vlepetih;
    property  cause_Vlepetih : Integer read Fcause_Vlepetih write Fcause_Vlepetih;
    property  central_Export_Vlepetih : Integer read Fcentral_Export_Vlepetih write Fcentral_Export_Vlepetih;
    property dif_Genichesk : TXSDecimal read Fdif_Genichesk write Fdif_Genichesk;
    property  cause_Genichesk : Integer read Fcause_Genichesk write Fcause_Genichesk;
    property  central_Export_Genichesk : Integer read Fcentral_Export_Genichesk write Fcentral_Export_Genichesk;
    property dif_Gpristan : TXSDecimal read Fdif_Gpristan write Fdif_Gpristan;
    property  cause_Gpristan : Integer read Fcause_Gpristan write Fcause_Gpristan;
    property  central_Export_Gpristan : Integer read Fcentral_Export_Gpristan write Fcentral_Export_Gpristan;
    property dif_Ivanovka : TXSDecimal read Fdif_Ivanovka write Fdif_Ivanovka;
    property  cause_Ivanovka : Integer read Fcause_Ivanovka write Fcause_Ivanovka;
    property  central_Export_Ivanovka : Integer read Fcentral_Export_Ivanovka write Fcentral_Export_Ivanovka;
    property dif_Kahovka : TXSDecimal read Fdif_Kahovka write Fdif_Kahovka;
    property  cause_Kahovka : Integer read Fcause_Kahovka write Fcause_Kahovka;
    property  central_Export_Kahovka : Integer read Fcentral_Export_Kahovka write Fcentral_Export_Kahovka;
    property dif_Nkahovka : TXSDecimal read Fdif_Nkahovka write Fdif_Nkahovka;
    property  cause_Nkahovka : Integer read Fcause_Nkahovka write Fcause_Nkahovka;
    property  central_Export_Nkahovka : Integer read Fcentral_Export_Nkahovka write Fcentral_Export_Nkahovka;
    property dif_Ntroick : TXSDecimal read Fdif_Ntroick write Fdif_Ntroick;
    property  cause_Ntroick : Integer read Fcause_Ntroick write Fcause_Ntroick;
    property  central_Export_Ntroick : Integer read Fcentral_Export_Ntroick write Fcentral_Export_Ntroick;
    property dif_Skadovsk : TXSDecimal read Fdif_Skadovsk write Fdif_Skadovsk;
    property  cause_Skadovsk : Integer read Fcause_Skadovsk write Fcause_Skadovsk;
    property  central_Export_Skadovsk : Integer read Fcentral_Export_Skadovsk write Fcentral_Export_Skadovsk;
    property dif_Hmve : TXSDecimal read Fdif_Hmve write Fdif_Hmve;
    property  cause_Hmve : Integer read Fcause_Hmve write Fcause_Hmve;
    property  central_Export_Hmve : Integer read Fcentral_Export_Hmve write Fcentral_Export_Hmve;
    property dif_Hmem : TXSDecimal read Fdif_Hmem write Fdif_Hmem;
    property  cause_Hmem : Integer read Fcause_Hmem write Fcause_Hmem;
    property  central_Export_Hmem : Integer read Fcentral_Export_Hmem write Fcentral_Export_Hmem;
    property dif_Curup : TXSDecimal read Fdif_Curup write Fdif_Curup;
    property  cause_Curup : Integer read Fcause_Curup write Fcause_Curup;
    property  central_Export_Curup : Integer read Fcentral_Export_Curup write Fcentral_Export_Curup;
    property dif_Chaplinka : TXSDecimal read Fdif_Chaplinka write Fdif_Chaplinka;
    property  cause_Chaplinka : Integer read Fcause_Chaplinka write Fcause_Chaplinka;
    property  central_Export_Chaplinka : Integer read Fcentral_Export_Chaplinka write Fcentral_Export_Chaplinka;
  end;
}

  RQCentralExportAnalyseFilter = class(RQCentralExportAnalyse)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQCentralExportAnalyseShort = class(TRemotable)
  private
    Fcode : Integer;
    FdateStart : WideString;
    Fdif_Aparat : TXSDecimal;
    Fcause_Aparat : Integer;
    Fcentral_Export_Aparat : Integer;
    Fdif_Visokop : TXSDecimal;
    Fcause_Visokop : Integer;
    Fcentral_Export_Visokop : Integer;
    Fdif_Vlepetih : TXSDecimal;
    Fcause_Vlepetih : Integer;
    Fcentral_Export_Vlepetih : Integer;
    Fdif_Genichesk : TXSDecimal;
    Fcause_Genichesk : Integer;
    Fcentral_Export_Genichesk : Integer;
    Fdif_Gpristan : TXSDecimal;
    Fcause_Gpristan : Integer;
    Fcentral_Export_Gpristan : Integer;
    Fdif_Ivanovka : TXSDecimal;
    Fcause_Ivanovka : Integer;
    Fcentral_Export_Ivanovka : Integer;
    Fdif_Kahovka : TXSDecimal;
    Fcause_Kahovka : Integer;
    Fcentral_Export_Kahovka : Integer;
    Fdif_Nkahovka : TXSDecimal;
    Fcause_Nkahovka : Integer;
    Fcentral_Export_Nkahovka : Integer;
    Fdif_Ntroick : TXSDecimal;
    Fcause_Ntroick : Integer;
    Fcentral_Export_Ntroick : Integer;
    Fdif_Skadovsk : TXSDecimal;
    Fcause_Skadovsk : Integer;
    Fcentral_Export_Skadovsk : Integer;
    Fdif_Hmve : TXSDecimal;
    Fcause_Hmve : Integer;
    Fcentral_Export_Hmve : Integer;
    Fdif_Hmem : TXSDecimal;
    Fcause_Hmem : Integer;
    Fcentral_Export_Hmem : Integer;
    Fdif_Curup : TXSDecimal;
    Fcause_Curup : Integer;
    Fcentral_Export_Curup : Integer;
    Fdif_Chaplinka : TXSDecimal;
    Fcause_Chaplinka : Integer;
    Fcentral_Export_Chaplinka : Integer;

    Fcountplan_Aparat: TXSDecimal;
    Fcountplan_Visokop : TXSDecimal;
    Fcountplan_Vlepetih : TXSDecimal;
    Fcountplan_Genichesk : TXSDecimal;
    Fcountplan_Gpristan : TXSDecimal;
    Fcountplan_Ivanovka : TXSDecimal;
    Fcountplan_Kahovka : TXSDecimal;
    Fcountplan_Nkahovka : TXSDecimal;
    Fcountplan_Ntroick : TXSDecimal;
    Fcountplan_Skadovsk : TXSDecimal;
    Fcountplan_Hmve : TXSDecimal;
    Fcountplan_Hmem : TXSDecimal;
    Fcountplan_Curup : TXSDecimal;
    Fcountplan_Chaplinka: TXSDecimal;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property dateStart : WideString read FdateStart write FdateStart;
    property dif_Aparat : TXSDecimal read Fdif_Aparat write Fdif_Aparat;
    property  cause_Aparat : Integer read Fcause_Aparat write Fcause_Aparat;
    property  central_Export_Aparat : Integer read Fcentral_Export_Aparat write Fcentral_Export_Aparat;
    property dif_Visokop : TXSDecimal read Fdif_Visokop write Fdif_Visokop;
    property  cause_Visokop : Integer read Fcause_Visokop write Fcause_Visokop;
    property  central_Export_Visokop : Integer read Fcentral_Export_Visokop write Fcentral_Export_Visokop;
    property dif_Vlepetih : TXSDecimal read Fdif_Vlepetih write Fdif_Vlepetih;
    property  cause_Vlepetih : Integer read Fcause_Vlepetih write Fcause_Vlepetih;
    property  central_Export_Vlepetih : Integer read Fcentral_Export_Vlepetih write Fcentral_Export_Vlepetih;
    property dif_Genichesk : TXSDecimal read Fdif_Genichesk write Fdif_Genichesk;
    property  cause_Genichesk : Integer read Fcause_Genichesk write Fcause_Genichesk;
    property  central_Export_Genichesk : Integer read Fcentral_Export_Genichesk write Fcentral_Export_Genichesk;
    property dif_Gpristan : TXSDecimal read Fdif_Gpristan write Fdif_Gpristan;
    property  cause_Gpristan : Integer read Fcause_Gpristan write Fcause_Gpristan;
    property  central_Export_Gpristan : Integer read Fcentral_Export_Gpristan write Fcentral_Export_Gpristan;
    property dif_Ivanovka : TXSDecimal read Fdif_Ivanovka write Fdif_Ivanovka;
    property  cause_Ivanovka : Integer read Fcause_Ivanovka write Fcause_Ivanovka;
    property  central_Export_Ivanovka : Integer read Fcentral_Export_Ivanovka write Fcentral_Export_Ivanovka;
    property dif_Kahovka : TXSDecimal read Fdif_Kahovka write Fdif_Kahovka;
    property  cause_Kahovka : Integer read Fcause_Kahovka write Fcause_Kahovka;
    property  central_Export_Kahovka : Integer read Fcentral_Export_Kahovka write Fcentral_Export_Kahovka;
    property dif_Nkahovka : TXSDecimal read Fdif_Nkahovka write Fdif_Nkahovka;
    property  cause_Nkahovka : Integer read Fcause_Nkahovka write Fcause_Nkahovka;
    property  central_Export_Nkahovka : Integer read Fcentral_Export_Nkahovka write Fcentral_Export_Nkahovka;
    property dif_Ntroick : TXSDecimal read Fdif_Ntroick write Fdif_Ntroick;
    property  cause_Ntroick : Integer read Fcause_Ntroick write Fcause_Ntroick;
    property  central_Export_Ntroick : Integer read Fcentral_Export_Ntroick write Fcentral_Export_Ntroick;
    property dif_Skadovsk : TXSDecimal read Fdif_Skadovsk write Fdif_Skadovsk;
    property  cause_Skadovsk : Integer read Fcause_Skadovsk write Fcause_Skadovsk;
    property  central_Export_Skadovsk : Integer read Fcentral_Export_Skadovsk write Fcentral_Export_Skadovsk;
    property dif_Hmve : TXSDecimal read Fdif_Hmve write Fdif_Hmve;
    property  cause_Hmve : Integer read Fcause_Hmve write Fcause_Hmve;
    property  central_Export_Hmve : Integer read Fcentral_Export_Hmve write Fcentral_Export_Hmve;
    property dif_Hmem : TXSDecimal read Fdif_Hmem write Fdif_Hmem;
    property  cause_Hmem : Integer read Fcause_Hmem write Fcause_Hmem;
    property  central_Export_Hmem : Integer read Fcentral_Export_Hmem write Fcentral_Export_Hmem;
    property dif_Curup : TXSDecimal read Fdif_Curup write Fdif_Curup;
    property  cause_Curup : Integer read Fcause_Curup write Fcause_Curup;
    property  central_Export_Curup : Integer read Fcentral_Export_Curup write Fcentral_Export_Curup;
    property dif_Chaplinka : TXSDecimal read Fdif_Chaplinka write Fdif_Chaplinka;
    property  cause_Chaplinka : Integer read Fcause_Chaplinka write Fcause_Chaplinka;
    property  central_Export_Chaplinka : Integer read Fcentral_Export_Chaplinka write Fcentral_Export_Chaplinka;


    property countplan_Aparat: TXSDecimal read  Fcountplan_Aparat write Fcountplan_Aparat;
    property countplan_Visokop : TXSDecimal read Fcountplan_Visokop write Fcountplan_Visokop;
    property countplan_Vlepetih : TXSDecimal read Fcountplan_Vlepetih write Fcountplan_Vlepetih;
    property countplan_Genichesk : TXSDecimal read Fcountplan_Genichesk write Fcountplan_Genichesk;
    property countplan_Gpristan : TXSDecimal read Fcountplan_Gpristan write Fcountplan_Gpristan;
    property countplan_Ivanovka : TXSDecimal read Fcountplan_Ivanovka write Fcountplan_Ivanovka;
    property countplan_Kahovka : TXSDecimal read Fcountplan_Kahovka write Fcountplan_Kahovka;
    property countplan_Nkahovka : TXSDecimal read Fcountplan_Nkahovka write Fcountplan_Nkahovka;
    property countplan_Ntroick : TXSDecimal read Fcountplan_Ntroick write Fcountplan_Ntroick;
    property countplan_Skadovsk : TXSDecimal read Fcountplan_Skadovsk write Fcountplan_Skadovsk;
    property countplan_Hmve : TXSDecimal read Fcountplan_Hmve write Fcountplan_Hmve;
    property countplan_Hmem : TXSDecimal read Fcountplan_Hmem write Fcountplan_Hmem;
    property countplan_Curup : TXSDecimal read Fcountplan_Curup write Fcountplan_Curup;
    property countplan_Chaplinka: TXSDecimal read Fcountplan_Chaplinka write Fcountplan_Chaplinka;
  end;

  ArrayOfRQCentralExportAnalyseShort = array of RQCentralExportAnalyseShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQCentralExportAnalyseShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQCentralExportAnalyseShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQCentralExportAnalyseShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQCentralExportAnalyseController/message/
  // soapAction: http://ksoe.org/RQCentralExportAnalyseController/action/RQCentralExportAnalyseController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQCentralExportAnalyseControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQCentralExportAnalyseController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQCentralExportAnalyseControllerSoapPort = interface(IInvokable)
  ['{B7143A10-82EF-4A40-A022-D790C575D6D3}']
    function add(const aRQCentralExportAnalyse: RQCentralExportAnalyse): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQCentralExportAnalyse: RQCentralExportAnalyse); stdcall;
    function getObject(const anObjectCode: Integer): RQCentralExportAnalyse; stdcall;
    function getList: RQCentralExportAnalyseShortList; stdcall;
    function getFilteredList(const aRQCentralExportAnalyseFilter: RQCentralExportAnalyseFilter): RQCentralExportAnalyseShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQCentralExportAnalyseShortList; stdcall;
//    function getScrollableFilteredList(const aRQCentralExportAnalyseFilter: RQCentralExportAnalyseFilter; const aFromPosition: Integer; const aQuantity: Integer): RQCentralExportAnalyseShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQCentralExportAnalyseShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQCentralExportAnalyseFilter: RQCentralExportAnalyseFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQCentralExportAnalyseShort; stdcall;

    function getScrollableFilteredList(const dateStart: String; const dateFinal : String; const depCode : Integer): RQCentralExportAnalyseShortList; stdcall;
    // детализаци€ по строке какие планы попали в €чейку
    function getScrollableListPlan(const dateStart: String; const dateFinal : String; const depCode : Integer): ENPlanWorkShortList; stdcall;
  end;


implementation



  destructor RQCentralExportAnalyse.Destroy;
  begin
    if Assigned(Fdif_Aparat) then
      dif_Aparat.Free;
    if Assigned(Fdif_Visokop) then
      dif_Visokop.Free;
    if Assigned(Fdif_Vlepetih) then
      dif_Vlepetih.Free;
    if Assigned(Fdif_Genichesk) then
      dif_Genichesk.Free;
    if Assigned(Fdif_Gpristan) then
      dif_Gpristan.Free;
    if Assigned(Fdif_Ivanovka) then
      dif_Ivanovka.Free;
    if Assigned(Fdif_Kahovka) then
      dif_Kahovka.Free;
    if Assigned(Fdif_Nkahovka) then
      dif_Nkahovka.Free;
    if Assigned(Fdif_Ntroick) then
      dif_Ntroick.Free;
    if Assigned(Fdif_Skadovsk) then
      dif_Skadovsk.Free;
    if Assigned(Fdif_Hmve) then
      dif_Hmve.Free;
    if Assigned(Fdif_Hmem) then
      dif_Hmem.Free;
    if Assigned(Fdif_Curup) then
      dif_Curup.Free;
    if Assigned(Fdif_Chaplinka) then
      dif_Chaplinka.Free;
    inherited Destroy;
  end;

{
  destructor RQCentralExportAnalyseFilter.Destroy;
  begin
    if Assigned(Fdif_Aparat) then
      dif_Aparat.Free;
    if Assigned(Fdif_Visokop) then
      dif_Visokop.Free;
    if Assigned(Fdif_Vlepetih) then
      dif_Vlepetih.Free;
    if Assigned(Fdif_Genichesk) then
      dif_Genichesk.Free;
    if Assigned(Fdif_Gpristan) then
      dif_Gpristan.Free;
    if Assigned(Fdif_Ivanovka) then
      dif_Ivanovka.Free;
    if Assigned(Fdif_Kahovka) then
      dif_Kahovka.Free;
    if Assigned(Fdif_Nkahovka) then
      dif_Nkahovka.Free;
    if Assigned(Fdif_Ntroick) then
      dif_Ntroick.Free;
    if Assigned(Fdif_Skadovsk) then
      dif_Skadovsk.Free;
    if Assigned(Fdif_Hmve) then
      dif_Hmve.Free;
    if Assigned(Fdif_Hmem) then
      dif_Hmem.Free;
    if Assigned(Fdif_Curup) then
      dif_Curup.Free;
    if Assigned(Fdif_Chaplinka) then
      dif_Chaplinka.Free;
    inherited Destroy;
  end;
}

  destructor RQCentralExportAnalyseFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQCentralExportAnalyseShort.Destroy;
  begin
    if Assigned(Fdif_Aparat) then
      dif_Aparat.Free;
    if Assigned(Fdif_Visokop) then
      dif_Visokop.Free;
    if Assigned(Fdif_Vlepetih) then
      dif_Vlepetih.Free;
    if Assigned(Fdif_Genichesk) then
      dif_Genichesk.Free;
    if Assigned(Fdif_Gpristan) then
      dif_Gpristan.Free;
    if Assigned(Fdif_Ivanovka) then
      dif_Ivanovka.Free;
    if Assigned(Fdif_Kahovka) then
      dif_Kahovka.Free;
    if Assigned(Fdif_Nkahovka) then
      dif_Nkahovka.Free;
    if Assigned(Fdif_Ntroick) then
      dif_Ntroick.Free;
    if Assigned(Fdif_Skadovsk) then
      dif_Skadovsk.Free;
    if Assigned(Fdif_Hmve) then
      dif_Hmve.Free;
    if Assigned(Fdif_Hmem) then
      dif_Hmem.Free;
    if Assigned(Fdif_Curup) then
      dif_Curup.Free;
    if Assigned(Fdif_Chaplinka) then
      dif_Chaplinka.Free;
    inherited Destroy;
  end;

  destructor RQCentralExportAnalyseShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQCentralExportAnalyse, 'http://ksoe.org/EnergyproControllerService/type/', 'RQCentralExportAnalyse');
  RemClassRegistry.RegisterXSClass(RQCentralExportAnalyseRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQCentralExportAnalyseRef');
  RemClassRegistry.RegisterXSClass(RQCentralExportAnalyseFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQCentralExportAnalyseFilter');
  RemClassRegistry.RegisterXSClass(RQCentralExportAnalyseShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQCentralExportAnalyseShort');
  RemClassRegistry.RegisterXSClass(RQCentralExportAnalyseShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQCentralExportAnalyseShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQCentralExportAnalyseShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQCentralExportAnalyseShort');

  InvRegistry.RegisterInterface(TypeInfo(RQCentralExportAnalyseControllerSoapPort), 'http://ksoe.org/RQCentralExportAnalyseController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQCentralExportAnalyseControllerSoapPort), 'http://ksoe.org/RQCentralExportAnalyseController/action/RQCentralExportAnalyseController.%operationName%');


end.
