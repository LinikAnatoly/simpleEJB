unit ENIPItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,TKMeasurementController
   ,ENIPItemStatusController
   ,ENInvestProgramGroupsController
   ,ENIPPurposeProgramController
   ,ENIPController
   ,ENMethodExecuteWorkController
   ,ENIPImplementationTypeController
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

  ENIPItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENIPItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENIPItem = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FbuhName : WideString;
    FitemNumber : WideString;
    FinvNumber : WideString;
    FisProjectDocument : Integer;
    Ffinancing : WideString;
    FcommentGen : WideString;
    FcountGen : TXSDecimal;
    Fprice : TXSDecimal;
    FsumGen : TXSDecimal;
    Fquarter1count : TXSDecimal;
    Fquarter1sum : TXSDecimal;
    Fquarter2count : TXSDecimal;
    Fquarter2sum : TXSDecimal;
    Fquarter3count : TXSDecimal;
    Fquarter3sum : TXSDecimal;
    Fquarter4count : TXSDecimal;
    Fquarter4sum : TXSDecimal;
    FcountGenInside : TXSDecimal;
    FpriceInside : TXSDecimal;
    FsumGenInside : TXSDecimal;
    Fmm1countInside : TXSDecimal;
    Fmm1sumInside : TXSDecimal;
    Fmm2countInside : TXSDecimal;
    Fmm2sumInside : TXSDecimal;
    Fmm3countInside : TXSDecimal;
    Fmm3sumInside : TXSDecimal;
    Fmm4countInside : TXSDecimal;
    Fmm4sumInside : TXSDecimal;
    Fmm5countInside : TXSDecimal;
    Fmm5sumInside : TXSDecimal;
    Fmm6countInside : TXSDecimal;
    Fmm6sumInside : TXSDecimal;
    Fmm7countInside : TXSDecimal;
    Fmm7sumInside : TXSDecimal;
    Fmm8countInside : TXSDecimal;
    Fmm8sumInside : TXSDecimal;
    Fmm9countInside : TXSDecimal;
    Fmm9sumInside : TXSDecimal;
    Fmm10countInside : TXSDecimal;
    Fmm10sumInside : TXSDecimal;
    Fmm11countInside : TXSDecimal;
    Fmm11sumInside : TXSDecimal;
    Fmm12countInside : TXSDecimal;
    Fmm12sumInside : TXSDecimal;
    FinfoTenders : WideString;
    Fmodify_time : Int64;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
//???
    Fmeasurement : TKMeasurement;
//???
    FstatusRef : ENIPItemStatusRef;
//???
    FinvGroupRef : ENInvestProgramGroupsRef;
//???
    FrenRef : EPRenRef;
//???
    FpurposeProgramRef : ENIPPurposeProgramRef;
//???
    FipRef : ENIPRef;
//???
    FparentRef : ENIPItemRef;
//???
    FmethodExecWorkRef : ENMethodExecuteWorkRef;
//???
    FipImplementTypeRef : ENIPImplementationTypeRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property buhName : WideString read FbuhName write FbuhName;
    property itemNumber : WideString read FitemNumber write FitemNumber;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property  isProjectDocument : Integer read FisProjectDocument write FisProjectDocument;
    property financing : WideString read Ffinancing write Ffinancing;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property price : TXSDecimal read Fprice write Fprice;
    property sumGen : TXSDecimal read FsumGen write FsumGen;
    property quarter1count : TXSDecimal read Fquarter1count write Fquarter1count;
    property quarter1sum : TXSDecimal read Fquarter1sum write Fquarter1sum;
    property quarter2count : TXSDecimal read Fquarter2count write Fquarter2count;
    property quarter2sum : TXSDecimal read Fquarter2sum write Fquarter2sum;
    property quarter3count : TXSDecimal read Fquarter3count write Fquarter3count;
    property quarter3sum : TXSDecimal read Fquarter3sum write Fquarter3sum;
    property quarter4count : TXSDecimal read Fquarter4count write Fquarter4count;
    property quarter4sum : TXSDecimal read Fquarter4sum write Fquarter4sum;
    property countGenInside : TXSDecimal read FcountGenInside write FcountGenInside;
    property priceInside : TXSDecimal read FpriceInside write FpriceInside;
    property sumGenInside : TXSDecimal read FsumGenInside write FsumGenInside;
    property mm1countInside : TXSDecimal read Fmm1countInside write Fmm1countInside;
    property mm1sumInside : TXSDecimal read Fmm1sumInside write Fmm1sumInside;
    property mm2countInside : TXSDecimal read Fmm2countInside write Fmm2countInside;
    property mm2sumInside : TXSDecimal read Fmm2sumInside write Fmm2sumInside;
    property mm3countInside : TXSDecimal read Fmm3countInside write Fmm3countInside;
    property mm3sumInside : TXSDecimal read Fmm3sumInside write Fmm3sumInside;
    property mm4countInside : TXSDecimal read Fmm4countInside write Fmm4countInside;
    property mm4sumInside : TXSDecimal read Fmm4sumInside write Fmm4sumInside;
    property mm5countInside : TXSDecimal read Fmm5countInside write Fmm5countInside;
    property mm5sumInside : TXSDecimal read Fmm5sumInside write Fmm5sumInside;
    property mm6countInside : TXSDecimal read Fmm6countInside write Fmm6countInside;
    property mm6sumInside : TXSDecimal read Fmm6sumInside write Fmm6sumInside;
    property mm7countInside : TXSDecimal read Fmm7countInside write Fmm7countInside;
    property mm7sumInside : TXSDecimal read Fmm7sumInside write Fmm7sumInside;
    property mm8countInside : TXSDecimal read Fmm8countInside write Fmm8countInside;
    property mm8sumInside : TXSDecimal read Fmm8sumInside write Fmm8sumInside;
    property mm9countInside : TXSDecimal read Fmm9countInside write Fmm9countInside;
    property mm9sumInside : TXSDecimal read Fmm9sumInside write Fmm9sumInside;
    property mm10countInside : TXSDecimal read Fmm10countInside write Fmm10countInside;
    property mm10sumInside : TXSDecimal read Fmm10sumInside write Fmm10sumInside;
    property mm11countInside : TXSDecimal read Fmm11countInside write Fmm11countInside;
    property mm11sumInside : TXSDecimal read Fmm11sumInside write Fmm11sumInside;
    property mm12countInside : TXSDecimal read Fmm12countInside write Fmm12countInside;
    property mm12sumInside : TXSDecimal read Fmm12sumInside write Fmm12sumInside;
    property infoTenders : WideString read FinfoTenders write FinfoTenders;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property measurement : TKMeasurement read Fmeasurement write Fmeasurement;
    property statusRef : ENIPItemStatusRef read FstatusRef write FstatusRef;
    property invGroupRef : ENInvestProgramGroupsRef read FinvGroupRef write FinvGroupRef;
    property renRef : EPRenRef read FrenRef write FrenRef;
    property purposeProgramRef : ENIPPurposeProgramRef read FpurposeProgramRef write FpurposeProgramRef;
    property ipRef : ENIPRef read FipRef write FipRef;
    property parentRef : ENIPItemRef read FparentRef write FparentRef;
    property methodExecWorkRef : ENMethodExecuteWorkRef read FmethodExecWorkRef write FmethodExecWorkRef;
    property ipImplementTypeRef : ENIPImplementationTypeRef read FipImplementTypeRef write FipImplementTypeRef;
  end;

{
  ENIPItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
    FbuhName : WideString;
    FitemNumber : WideString;
    FinvNumber : WideString;
    FisProjectDocument : Integer;
    Ffinancing : WideString;
    FcommentGen : WideString;
    FcountGen : TXSDecimal;
    Fprice : TXSDecimal;
    FsumGen : TXSDecimal;
    Fquarter1count : TXSDecimal;
    Fquarter1sum : TXSDecimal;
    Fquarter2count : TXSDecimal;
    Fquarter2sum : TXSDecimal;
    Fquarter3count : TXSDecimal;
    Fquarter3sum : TXSDecimal;
    Fquarter4count : TXSDecimal;
    Fquarter4sum : TXSDecimal;
    FcountGenInside : TXSDecimal;
    FpriceInside : TXSDecimal;
    FsumGenInside : TXSDecimal;
    Fmm1countInside : TXSDecimal;
    Fmm1sumInside : TXSDecimal;
    Fmm2countInside : TXSDecimal;
    Fmm2sumInside : TXSDecimal;
    Fmm3countInside : TXSDecimal;
    Fmm3sumInside : TXSDecimal;
    Fmm4countInside : TXSDecimal;
    Fmm4sumInside : TXSDecimal;
    Fmm5countInside : TXSDecimal;
    Fmm5sumInside : TXSDecimal;
    Fmm6countInside : TXSDecimal;
    Fmm6sumInside : TXSDecimal;
    Fmm7countInside : TXSDecimal;
    Fmm7sumInside : TXSDecimal;
    Fmm8countInside : TXSDecimal;
    Fmm8sumInside : TXSDecimal;
    Fmm9countInside : TXSDecimal;
    Fmm9sumInside : TXSDecimal;
    Fmm10countInside : TXSDecimal;
    Fmm10sumInside : TXSDecimal;
    Fmm11countInside : TXSDecimal;
    Fmm11sumInside : TXSDecimal;
    Fmm12countInside : TXSDecimal;
    Fmm12sumInside : TXSDecimal;
    FinfoTenders : WideString;
    Fmodify_time : Int64;
    FuserAdd : WideString;
    FdateAdd : DateTime;
    FuserGen : WideString;
    FdateEdit : DateTime;
//???
    Fmeasurement : TKMeasurement;
//???
    FstatusRef : ENIPItemStatusRef;
//???
    FinvGroupRef : ENInvestProgramGroupsRef;
//???
    FrenRef : EPRenRef;
//???
    FpurposeProgramRef : ENIPPurposeProgramRef;
//???
    FipRef : ENIPRef;
//???
    FparentRef : ENIPItemRef;
//???
    FmethodExecWorkRef : ENMethodExecuteWorkRef;
//???
    FipImplementTypeRef : ENIPImplementationTypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property buhName : WideString read FbuhName write FbuhName;
    property itemNumber : WideString read FitemNumber write FitemNumber;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property  isProjectDocument : Integer read FisProjectDocument write FisProjectDocument;
    property financing : WideString read Ffinancing write Ffinancing;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property price : TXSDecimal read Fprice write Fprice;
    property sumGen : TXSDecimal read FsumGen write FsumGen;
    property quarter1count : TXSDecimal read Fquarter1count write Fquarter1count;
    property quarter1sum : TXSDecimal read Fquarter1sum write Fquarter1sum;
    property quarter2count : TXSDecimal read Fquarter2count write Fquarter2count;
    property quarter2sum : TXSDecimal read Fquarter2sum write Fquarter2sum;
    property quarter3count : TXSDecimal read Fquarter3count write Fquarter3count;
    property quarter3sum : TXSDecimal read Fquarter3sum write Fquarter3sum;
    property quarter4count : TXSDecimal read Fquarter4count write Fquarter4count;
    property quarter4sum : TXSDecimal read Fquarter4sum write Fquarter4sum;
    property countGenInside : TXSDecimal read FcountGenInside write FcountGenInside;
    property priceInside : TXSDecimal read FpriceInside write FpriceInside;
    property sumGenInside : TXSDecimal read FsumGenInside write FsumGenInside;
    property mm1countInside : TXSDecimal read Fmm1countInside write Fmm1countInside;
    property mm1sumInside : TXSDecimal read Fmm1sumInside write Fmm1sumInside;
    property mm2countInside : TXSDecimal read Fmm2countInside write Fmm2countInside;
    property mm2sumInside : TXSDecimal read Fmm2sumInside write Fmm2sumInside;
    property mm3countInside : TXSDecimal read Fmm3countInside write Fmm3countInside;
    property mm3sumInside : TXSDecimal read Fmm3sumInside write Fmm3sumInside;
    property mm4countInside : TXSDecimal read Fmm4countInside write Fmm4countInside;
    property mm4sumInside : TXSDecimal read Fmm4sumInside write Fmm4sumInside;
    property mm5countInside : TXSDecimal read Fmm5countInside write Fmm5countInside;
    property mm5sumInside : TXSDecimal read Fmm5sumInside write Fmm5sumInside;
    property mm6countInside : TXSDecimal read Fmm6countInside write Fmm6countInside;
    property mm6sumInside : TXSDecimal read Fmm6sumInside write Fmm6sumInside;
    property mm7countInside : TXSDecimal read Fmm7countInside write Fmm7countInside;
    property mm7sumInside : TXSDecimal read Fmm7sumInside write Fmm7sumInside;
    property mm8countInside : TXSDecimal read Fmm8countInside write Fmm8countInside;
    property mm8sumInside : TXSDecimal read Fmm8sumInside write Fmm8sumInside;
    property mm9countInside : TXSDecimal read Fmm9countInside write Fmm9countInside;
    property mm9sumInside : TXSDecimal read Fmm9sumInside write Fmm9sumInside;
    property mm10countInside : TXSDecimal read Fmm10countInside write Fmm10countInside;
    property mm10sumInside : TXSDecimal read Fmm10sumInside write Fmm10sumInside;
    property mm11countInside : TXSDecimal read Fmm11countInside write Fmm11countInside;
    property mm11sumInside : TXSDecimal read Fmm11sumInside write Fmm11sumInside;
    property mm12countInside : TXSDecimal read Fmm12countInside write Fmm12countInside;
    property mm12sumInside : TXSDecimal read Fmm12sumInside write Fmm12sumInside;
    property infoTenders : WideString read FinfoTenders write FinfoTenders;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : DateTime;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property measurement : TKMeasurement read Fmeasurement write Fmeasurement;
    property statusRef : ENIPItemStatusRef read FstatusRef write FstatusRef;
    property invGroupRef : ENInvestProgramGroupsRef read FinvGroupRef write FinvGroupRef;
    property renRef : EPRenRef read FrenRef write FrenRef;
    property purposeProgramRef : ENIPPurposeProgramRef read FpurposeProgramRef write FpurposeProgramRef;
    property ipRef : ENIPRef read FipRef write FipRef;
    property parentRef : ENIPItemRef read FparentRef write FparentRef;
    property methodExecWorkRef : ENMethodExecuteWorkRef read FmethodExecWorkRef write FmethodExecWorkRef;
    property ipImplementTypeRef : ENIPImplementationTypeRef read FipImplementTypeRef write FipImplementTypeRef;
  end;
}

  ENIPItemFilter = class(ENIPItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENIPItemShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FbuhName : WideString;
    FitemNumber : WideString;
    FinvNumber : WideString;
    FisProjectDocument : Integer;
    Ffinancing : WideString;
    FcommentGen : WideString;
    FcountGen : TXSDecimal;
    Fprice : TXSDecimal;
    FsumGen : TXSDecimal;
    Fquarter1count : TXSDecimal;
    Fquarter1sum : TXSDecimal;
    Fquarter2count : TXSDecimal;
    Fquarter2sum : TXSDecimal;
    Fquarter3count : TXSDecimal;
    Fquarter3sum : TXSDecimal;
    Fquarter4count : TXSDecimal;
    Fquarter4sum : TXSDecimal;
    FcountGenInside : TXSDecimal;
    FpriceInside : TXSDecimal;
    FsumGenInside : TXSDecimal;
    Fmm1countInside : TXSDecimal;
    Fmm1sumInside : TXSDecimal;
    Fmm2countInside : TXSDecimal;
    Fmm2sumInside : TXSDecimal;
    Fmm3countInside : TXSDecimal;
    Fmm3sumInside : TXSDecimal;
    Fmm4countInside : TXSDecimal;
    Fmm4sumInside : TXSDecimal;
    Fmm5countInside : TXSDecimal;
    Fmm5sumInside : TXSDecimal;
    Fmm6countInside : TXSDecimal;
    Fmm6sumInside : TXSDecimal;
    Fmm7countInside : TXSDecimal;
    Fmm7sumInside : TXSDecimal;
    Fmm8countInside : TXSDecimal;
    Fmm8sumInside : TXSDecimal;
    Fmm9countInside : TXSDecimal;
    Fmm9sumInside : TXSDecimal;
    Fmm10countInside : TXSDecimal;
    Fmm10sumInside : TXSDecimal;
    Fmm11countInside : TXSDecimal;
    Fmm11sumInside : TXSDecimal;
    Fmm12countInside : TXSDecimal;
    Fmm12sumInside : TXSDecimal;
    FinfoTenders : WideString;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FmeasurementCode : Integer;
    FmeasurementName : WideString;
    FstatusRefCode : Integer;
    FstatusRefName : WideString;
    FinvGroupRefCode : Integer;
    FinvGroupRefName : WideString;
    FinvGroupRefCommentgen : WideString;
    FrenRefCode : Integer;
    FrenRefName : WideString;
    FpurposeProgramRefCode : Integer;
    FpurposeProgramRefName : WideString;
    FipRefCode : Integer;
    FipRefName : WideString;
    FipRefYearGen : Integer;
    FipRefVersion : Integer;
    FipRefCommentGen : WideString;
    FipRefDateAdd : TXSDateTime;
    FipRefDateEdit : TXSDateTime;
    FipRefUserAdd : WideString;
    FipRefUserEdit : WideString;
    FparentRefCode : Integer;
    FparentRefName : WideString;
    FparentRefBuhName : WideString;
    FparentRefItemNumber : WideString;
    FparentRefInvNumber : WideString;
    FparentRefIsProjectDocument : Integer;
    FparentRefFinancing : WideString;
    FparentRefCommentGen : WideString;
    FparentRefCountGen : TXSDecimal;
    FparentRefPrice : TXSDecimal;
    FparentRefSumGen : TXSDecimal;
    FparentRefQuarter1count : TXSDecimal;
    FparentRefQuarter1sum : TXSDecimal;
    FparentRefQuarter2count : TXSDecimal;
    FparentRefQuarter2sum : TXSDecimal;
    FparentRefQuarter3count : TXSDecimal;
    FparentRefQuarter3sum : TXSDecimal;
    FparentRefQuarter4count : TXSDecimal;
    FparentRefQuarter4sum : TXSDecimal;
    FparentRefCountGenInside : TXSDecimal;
    FparentRefPriceInside : TXSDecimal;
    FparentRefSumGenInside : TXSDecimal;
    FparentRefMm1countInside : TXSDecimal;
    FparentRefMm1sumInside : TXSDecimal;
    FparentRefMm2countInside : TXSDecimal;
    FparentRefMm2sumInside : TXSDecimal;
    FparentRefMm3countInside : TXSDecimal;
    FparentRefMm3sumInside : TXSDecimal;
    FparentRefMm4countInside : TXSDecimal;
    FparentRefMm4sumInside : TXSDecimal;
    FparentRefMm5countInside : TXSDecimal;
    FparentRefMm5sumInside : TXSDecimal;
    FparentRefMm6countInside : TXSDecimal;
    FparentRefMm6sumInside : TXSDecimal;
    FparentRefMm7countInside : TXSDecimal;
    FparentRefMm7sumInside : TXSDecimal;
    FparentRefMm8countInside : TXSDecimal;
    FparentRefMm8sumInside : TXSDecimal;
    FparentRefMm9countInside : TXSDecimal;
    FparentRefMm9sumInside : TXSDecimal;
    FparentRefMm10countInside : TXSDecimal;
    FparentRefMm10sumInside : TXSDecimal;
    FparentRefMm11countInside : TXSDecimal;
    FparentRefMm11sumInside : TXSDecimal;
    FparentRefMm12countInside : TXSDecimal;
    FparentRefMm12sumInside : TXSDecimal;
    FparentRefInfoTenders : WideString;
    FparentRefUserAdd : WideString;
    FparentRefDateAdd : TXSDateTime;
    FparentRefUserGen : WideString;
    FparentRefDateEdit : TXSDateTime;
    FmethodExecWorkRefCode : Integer;
    FmethodExecWorkRefName : WideString;
    FipImplementTypeRefCode : Integer;
    FipImplementTypeRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property buhName : WideString read FbuhName write FbuhName;
    property itemNumber : WideString read FitemNumber write FitemNumber;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property  isProjectDocument : Integer read FisProjectDocument write FisProjectDocument;
    property financing : WideString read Ffinancing write Ffinancing;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property price : TXSDecimal read Fprice write Fprice;
    property sumGen : TXSDecimal read FsumGen write FsumGen;
    property quarter1count : TXSDecimal read Fquarter1count write Fquarter1count;
    property quarter1sum : TXSDecimal read Fquarter1sum write Fquarter1sum;
    property quarter2count : TXSDecimal read Fquarter2count write Fquarter2count;
    property quarter2sum : TXSDecimal read Fquarter2sum write Fquarter2sum;
    property quarter3count : TXSDecimal read Fquarter3count write Fquarter3count;
    property quarter3sum : TXSDecimal read Fquarter3sum write Fquarter3sum;
    property quarter4count : TXSDecimal read Fquarter4count write Fquarter4count;
    property quarter4sum : TXSDecimal read Fquarter4sum write Fquarter4sum;
    property countGenInside : TXSDecimal read FcountGenInside write FcountGenInside;
    property priceInside : TXSDecimal read FpriceInside write FpriceInside;
    property sumGenInside : TXSDecimal read FsumGenInside write FsumGenInside;
    property mm1countInside : TXSDecimal read Fmm1countInside write Fmm1countInside;
    property mm1sumInside : TXSDecimal read Fmm1sumInside write Fmm1sumInside;
    property mm2countInside : TXSDecimal read Fmm2countInside write Fmm2countInside;
    property mm2sumInside : TXSDecimal read Fmm2sumInside write Fmm2sumInside;
    property mm3countInside : TXSDecimal read Fmm3countInside write Fmm3countInside;
    property mm3sumInside : TXSDecimal read Fmm3sumInside write Fmm3sumInside;
    property mm4countInside : TXSDecimal read Fmm4countInside write Fmm4countInside;
    property mm4sumInside : TXSDecimal read Fmm4sumInside write Fmm4sumInside;
    property mm5countInside : TXSDecimal read Fmm5countInside write Fmm5countInside;
    property mm5sumInside : TXSDecimal read Fmm5sumInside write Fmm5sumInside;
    property mm6countInside : TXSDecimal read Fmm6countInside write Fmm6countInside;
    property mm6sumInside : TXSDecimal read Fmm6sumInside write Fmm6sumInside;
    property mm7countInside : TXSDecimal read Fmm7countInside write Fmm7countInside;
    property mm7sumInside : TXSDecimal read Fmm7sumInside write Fmm7sumInside;
    property mm8countInside : TXSDecimal read Fmm8countInside write Fmm8countInside;
    property mm8sumInside : TXSDecimal read Fmm8sumInside write Fmm8sumInside;
    property mm9countInside : TXSDecimal read Fmm9countInside write Fmm9countInside;
    property mm9sumInside : TXSDecimal read Fmm9sumInside write Fmm9sumInside;
    property mm10countInside : TXSDecimal read Fmm10countInside write Fmm10countInside;
    property mm10sumInside : TXSDecimal read Fmm10sumInside write Fmm10sumInside;
    property mm11countInside : TXSDecimal read Fmm11countInside write Fmm11countInside;
    property mm11sumInside : TXSDecimal read Fmm11sumInside write Fmm11sumInside;
    property mm12countInside : TXSDecimal read Fmm12countInside write Fmm12countInside;
    property mm12sumInside : TXSDecimal read Fmm12sumInside write Fmm12sumInside;
    property infoTenders : WideString read FinfoTenders write FinfoTenders;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property measurementCode : Integer read FmeasurementCode write FmeasurementCode;
    property measurementName : WideString read FmeasurementName write FmeasurementName;
    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode;
    property statusRefName : WideString read FstatusRefName write FstatusRefName;
    property invGroupRefCode : Integer read FinvGroupRefCode write FinvGroupRefCode;
    property invGroupRefName : WideString read FinvGroupRefName write FinvGroupRefName;
    property invGroupRefCommentgen : WideString read FinvGroupRefCommentgen write FinvGroupRefCommentgen;
    property renRefCode : Integer read FrenRefCode write FrenRefCode;
    property renRefName : WideString read FrenRefName write FrenRefName;
    property purposeProgramRefCode : Integer read FpurposeProgramRefCode write FpurposeProgramRefCode;
    property purposeProgramRefName : WideString read FpurposeProgramRefName write FpurposeProgramRefName;
    property ipRefCode : Integer read FipRefCode write FipRefCode;
    property ipRefName : WideString read FipRefName write FipRefName;
    property ipRefYearGen : Integer read FipRefYearGen write FipRefYearGen;
    property ipRefVersion : Integer read FipRefVersion write FipRefVersion;
    property ipRefCommentGen : WideString read FipRefCommentGen write FipRefCommentGen;
    property ipRefDateAdd : TXSDateTime read FipRefDateAdd write FipRefDateAdd;
    property ipRefDateEdit : TXSDateTime read FipRefDateEdit write FipRefDateEdit;
    property ipRefUserAdd : WideString read FipRefUserAdd write FipRefUserAdd;
    property ipRefUserEdit : WideString read FipRefUserEdit write FipRefUserEdit;
    property parentRefCode : Integer read FparentRefCode write FparentRefCode;
    property parentRefName : WideString read FparentRefName write FparentRefName;
    property parentRefBuhName : WideString read FparentRefBuhName write FparentRefBuhName;
    property parentRefItemNumber : WideString read FparentRefItemNumber write FparentRefItemNumber;
    property parentRefInvNumber : WideString read FparentRefInvNumber write FparentRefInvNumber;
    property parentRefIsProjectDocument : Integer read FparentRefIsProjectDocument write FparentRefIsProjectDocument;
    property parentRefFinancing : WideString read FparentRefFinancing write FparentRefFinancing;
    property parentRefCommentGen : WideString read FparentRefCommentGen write FparentRefCommentGen;
    property parentRefCountGen : TXSDecimal read FparentRefCountGen write FparentRefCountGen;
    property parentRefPrice : TXSDecimal read FparentRefPrice write FparentRefPrice;
    property parentRefSumGen : TXSDecimal read FparentRefSumGen write FparentRefSumGen;
    property parentRefQuarter1count : TXSDecimal read FparentRefQuarter1count write FparentRefQuarter1count;
    property parentRefQuarter1sum : TXSDecimal read FparentRefQuarter1sum write FparentRefQuarter1sum;
    property parentRefQuarter2count : TXSDecimal read FparentRefQuarter2count write FparentRefQuarter2count;
    property parentRefQuarter2sum : TXSDecimal read FparentRefQuarter2sum write FparentRefQuarter2sum;
    property parentRefQuarter3count : TXSDecimal read FparentRefQuarter3count write FparentRefQuarter3count;
    property parentRefQuarter3sum : TXSDecimal read FparentRefQuarter3sum write FparentRefQuarter3sum;
    property parentRefQuarter4count : TXSDecimal read FparentRefQuarter4count write FparentRefQuarter4count;
    property parentRefQuarter4sum : TXSDecimal read FparentRefQuarter4sum write FparentRefQuarter4sum;
    property parentRefCountGenInside : TXSDecimal read FparentRefCountGenInside write FparentRefCountGenInside;
    property parentRefPriceInside : TXSDecimal read FparentRefPriceInside write FparentRefPriceInside;
    property parentRefSumGenInside : TXSDecimal read FparentRefSumGenInside write FparentRefSumGenInside;
    property parentRefMm1countInside : TXSDecimal read FparentRefMm1countInside write FparentRefMm1countInside;
    property parentRefMm1sumInside : TXSDecimal read FparentRefMm1sumInside write FparentRefMm1sumInside;
    property parentRefMm2countInside : TXSDecimal read FparentRefMm2countInside write FparentRefMm2countInside;
    property parentRefMm2sumInside : TXSDecimal read FparentRefMm2sumInside write FparentRefMm2sumInside;
    property parentRefMm3countInside : TXSDecimal read FparentRefMm3countInside write FparentRefMm3countInside;
    property parentRefMm3sumInside : TXSDecimal read FparentRefMm3sumInside write FparentRefMm3sumInside;
    property parentRefMm4countInside : TXSDecimal read FparentRefMm4countInside write FparentRefMm4countInside;
    property parentRefMm4sumInside : TXSDecimal read FparentRefMm4sumInside write FparentRefMm4sumInside;
    property parentRefMm5countInside : TXSDecimal read FparentRefMm5countInside write FparentRefMm5countInside;
    property parentRefMm5sumInside : TXSDecimal read FparentRefMm5sumInside write FparentRefMm5sumInside;
    property parentRefMm6countInside : TXSDecimal read FparentRefMm6countInside write FparentRefMm6countInside;
    property parentRefMm6sumInside : TXSDecimal read FparentRefMm6sumInside write FparentRefMm6sumInside;
    property parentRefMm7countInside : TXSDecimal read FparentRefMm7countInside write FparentRefMm7countInside;
    property parentRefMm7sumInside : TXSDecimal read FparentRefMm7sumInside write FparentRefMm7sumInside;
    property parentRefMm8countInside : TXSDecimal read FparentRefMm8countInside write FparentRefMm8countInside;
    property parentRefMm8sumInside : TXSDecimal read FparentRefMm8sumInside write FparentRefMm8sumInside;
    property parentRefMm9countInside : TXSDecimal read FparentRefMm9countInside write FparentRefMm9countInside;
    property parentRefMm9sumInside : TXSDecimal read FparentRefMm9sumInside write FparentRefMm9sumInside;
    property parentRefMm10countInside : TXSDecimal read FparentRefMm10countInside write FparentRefMm10countInside;
    property parentRefMm10sumInside : TXSDecimal read FparentRefMm10sumInside write FparentRefMm10sumInside;
    property parentRefMm11countInside : TXSDecimal read FparentRefMm11countInside write FparentRefMm11countInside;
    property parentRefMm11sumInside : TXSDecimal read FparentRefMm11sumInside write FparentRefMm11sumInside;
    property parentRefMm12countInside : TXSDecimal read FparentRefMm12countInside write FparentRefMm12countInside;
    property parentRefMm12sumInside : TXSDecimal read FparentRefMm12sumInside write FparentRefMm12sumInside;
    property parentRefInfoTenders : WideString read FparentRefInfoTenders write FparentRefInfoTenders;
    property parentRefUserAdd : WideString read FparentRefUserAdd write FparentRefUserAdd;
    property parentRefDateAdd : TXSDateTime read FparentRefDateAdd write FparentRefDateAdd;
    property parentRefUserGen : WideString read FparentRefUserGen write FparentRefUserGen;
    property parentRefDateEdit : TXSDateTime read FparentRefDateEdit write FparentRefDateEdit;
    property methodExecWorkRefCode : Integer read FmethodExecWorkRefCode write FmethodExecWorkRefCode;
    property methodExecWorkRefName : WideString read FmethodExecWorkRefName write FmethodExecWorkRefName;
    property ipImplementTypeRefCode : Integer read FipImplementTypeRefCode write FipImplementTypeRefCode;
    property ipImplementTypeRefName : WideString read FipImplementTypeRefName write FipImplementTypeRefName;
  end;

  ArrayOfENIPItemShort = array of ENIPItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENIPItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENIPItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENIPItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENIPItemController/message/
  // soapAction: http://ksoe.org/ENIPItemController/action/ENIPItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENIPItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENIPItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENIPItemControllerSoapPort = interface(IInvokable)
    ['{4FD0973E-E115-4DA3-B9B8-FBBC70840069}']
    function add(const aENIPItem: ENIPItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENIPItem: ENIPItem); stdcall;
    function getObject(const anObjectCode: Integer): ENIPItem; stdcall;
    function getList: ENIPItemShortList; stdcall;
    function getFilteredList(const aENIPItemFilter: ENIPItemFilter): ENIPItemShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENIPItemShortList; stdcall;
    function getScrollableFilteredList(const aENIPItemFilter: ENIPItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ENIPItemShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENIPItemShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENIPItemFilter: ENIPItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENIPItemShort; stdcall;
    procedure saveSumInside(const aENIPItem: ENIPItem); stdcall;
    procedure saveinfoTenders(const aENIPItem: ENIPItem); stdcall;

  end;


implementation

  destructor ENIPItem.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(Fprice) then
      price.Free;
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(Fquarter1count) then
      quarter1count.Free;
    if Assigned(Fquarter1sum) then
      quarter1sum.Free;
    if Assigned(Fquarter2count) then
      quarter2count.Free;
    if Assigned(Fquarter2sum) then
      quarter2sum.Free;
    if Assigned(Fquarter3count) then
      quarter3count.Free;
    if Assigned(Fquarter3sum) then
      quarter3sum.Free;
    if Assigned(Fquarter4count) then
      quarter4count.Free;
    if Assigned(Fquarter4sum) then
      quarter4sum.Free;
    if Assigned(FcountGenInside) then
      countGenInside.Free;
    if Assigned(FpriceInside) then
      priceInside.Free;
    if Assigned(FsumGenInside) then
      sumGenInside.Free;
    if Assigned(Fmm1countInside) then
      mm1countInside.Free;
    if Assigned(Fmm1sumInside) then
      mm1sumInside.Free;
    if Assigned(Fmm2countInside) then
      mm2countInside.Free;
    if Assigned(Fmm2sumInside) then
      mm2sumInside.Free;
    if Assigned(Fmm3countInside) then
      mm3countInside.Free;
    if Assigned(Fmm3sumInside) then
      mm3sumInside.Free;
    if Assigned(Fmm4countInside) then
      mm4countInside.Free;
    if Assigned(Fmm4sumInside) then
      mm4sumInside.Free;
    if Assigned(Fmm5countInside) then
      mm5countInside.Free;
    if Assigned(Fmm5sumInside) then
      mm5sumInside.Free;
    if Assigned(Fmm6countInside) then
      mm6countInside.Free;
    if Assigned(Fmm6sumInside) then
      mm6sumInside.Free;
    if Assigned(Fmm7countInside) then
      mm7countInside.Free;
    if Assigned(Fmm7sumInside) then
      mm7sumInside.Free;
    if Assigned(Fmm8countInside) then
      mm8countInside.Free;
    if Assigned(Fmm8sumInside) then
      mm8sumInside.Free;
    if Assigned(Fmm9countInside) then
      mm9countInside.Free;
    if Assigned(Fmm9sumInside) then
      mm9sumInside.Free;
    if Assigned(Fmm10countInside) then
      mm10countInside.Free;
    if Assigned(Fmm10sumInside) then
      mm10sumInside.Free;
    if Assigned(Fmm11countInside) then
      mm11countInside.Free;
    if Assigned(Fmm11sumInside) then
      mm11sumInside.Free;
    if Assigned(Fmm12countInside) then
      mm12countInside.Free;
    if Assigned(Fmm12sumInside) then
      mm12sumInside.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fmeasurement) then
      measurement.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FinvGroupRef) then
      invGroupRef.Free;
    if Assigned(FrenRef) then
      renRef.Free;
    if Assigned(FpurposeProgramRef) then
      purposeProgramRef.Free;
    if Assigned(FipRef) then
      ipRef.Free;
    if Assigned(FparentRef) then
      parentRef.Free;
    if Assigned(FmethodExecWorkRef) then
      methodExecWorkRef.Free;
    if Assigned(FipImplementTypeRef) then
      ipImplementTypeRef.Free;
    inherited Destroy;
  end;

{
  destructor ENIPItemFilter.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(Fprice) then
      price.Free;
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(Fquarter1count) then
      quarter1count.Free;
    if Assigned(Fquarter1sum) then
      quarter1sum.Free;
    if Assigned(Fquarter2count) then
      quarter2count.Free;
    if Assigned(Fquarter2sum) then
      quarter2sum.Free;
    if Assigned(Fquarter3count) then
      quarter3count.Free;
    if Assigned(Fquarter3sum) then
      quarter3sum.Free;
    if Assigned(Fquarter4count) then
      quarter4count.Free;
    if Assigned(Fquarter4sum) then
      quarter4sum.Free;
    if Assigned(FcountGenInside) then
      countGenInside.Free;
    if Assigned(FpriceInside) then
      priceInside.Free;
    if Assigned(FsumGenInside) then
      sumGenInside.Free;
    if Assigned(Fmm1countInside) then
      mm1countInside.Free;
    if Assigned(Fmm1sumInside) then
      mm1sumInside.Free;
    if Assigned(Fmm2countInside) then
      mm2countInside.Free;
    if Assigned(Fmm2sumInside) then
      mm2sumInside.Free;
    if Assigned(Fmm3countInside) then
      mm3countInside.Free;
    if Assigned(Fmm3sumInside) then
      mm3sumInside.Free;
    if Assigned(Fmm4countInside) then
      mm4countInside.Free;
    if Assigned(Fmm4sumInside) then
      mm4sumInside.Free;
    if Assigned(Fmm5countInside) then
      mm5countInside.Free;
    if Assigned(Fmm5sumInside) then
      mm5sumInside.Free;
    if Assigned(Fmm6countInside) then
      mm6countInside.Free;
    if Assigned(Fmm6sumInside) then
      mm6sumInside.Free;
    if Assigned(Fmm7countInside) then
      mm7countInside.Free;
    if Assigned(Fmm7sumInside) then
      mm7sumInside.Free;
    if Assigned(Fmm8countInside) then
      mm8countInside.Free;
    if Assigned(Fmm8sumInside) then
      mm8sumInside.Free;
    if Assigned(Fmm9countInside) then
      mm9countInside.Free;
    if Assigned(Fmm9sumInside) then
      mm9sumInside.Free;
    if Assigned(Fmm10countInside) then
      mm10countInside.Free;
    if Assigned(Fmm10sumInside) then
      mm10sumInside.Free;
    if Assigned(Fmm11countInside) then
      mm11countInside.Free;
    if Assigned(Fmm11sumInside) then
      mm11sumInside.Free;
    if Assigned(Fmm12countInside) then
      mm12countInside.Free;
    if Assigned(Fmm12sumInside) then
      mm12sumInside.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fmeasurement) then
      measurement.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FinvGroupRef) then
      invGroupRef.Free;
    if Assigned(FrenRef) then
      renRef.Free;
    if Assigned(FpurposeProgramRef) then
      purposeProgramRef.Free;
    if Assigned(FipRef) then
      ipRef.Free;
    if Assigned(FparentRef) then
      parentRef.Free;
    if Assigned(FmethodExecWorkRef) then
      methodExecWorkRef.Free;
    if Assigned(FipImplementTypeRef) then
      ipImplementTypeRef.Free;
    inherited Destroy;
  end;
}

  destructor ENIPItemFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENIPItemShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(Fprice) then
      price.Free;
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(Fquarter1count) then
      quarter1count.Free;
    if Assigned(Fquarter1sum) then
      quarter1sum.Free;
    if Assigned(Fquarter2count) then
      quarter2count.Free;
    if Assigned(Fquarter2sum) then
      quarter2sum.Free;
    if Assigned(Fquarter3count) then
      quarter3count.Free;
    if Assigned(Fquarter3sum) then
      quarter3sum.Free;
    if Assigned(Fquarter4count) then
      quarter4count.Free;
    if Assigned(Fquarter4sum) then
      quarter4sum.Free;
    if Assigned(FcountGenInside) then
      countGenInside.Free;
    if Assigned(FpriceInside) then
      priceInside.Free;
    if Assigned(FsumGenInside) then
      sumGenInside.Free;
    if Assigned(Fmm1countInside) then
      mm1countInside.Free;
    if Assigned(Fmm1sumInside) then
      mm1sumInside.Free;
    if Assigned(Fmm2countInside) then
      mm2countInside.Free;
    if Assigned(Fmm2sumInside) then
      mm2sumInside.Free;
    if Assigned(Fmm3countInside) then
      mm3countInside.Free;
    if Assigned(Fmm3sumInside) then
      mm3sumInside.Free;
    if Assigned(Fmm4countInside) then
      mm4countInside.Free;
    if Assigned(Fmm4sumInside) then
      mm4sumInside.Free;
    if Assigned(Fmm5countInside) then
      mm5countInside.Free;
    if Assigned(Fmm5sumInside) then
      mm5sumInside.Free;
    if Assigned(Fmm6countInside) then
      mm6countInside.Free;
    if Assigned(Fmm6sumInside) then
      mm6sumInside.Free;
    if Assigned(Fmm7countInside) then
      mm7countInside.Free;
    if Assigned(Fmm7sumInside) then
      mm7sumInside.Free;
    if Assigned(Fmm8countInside) then
      mm8countInside.Free;
    if Assigned(Fmm8sumInside) then
      mm8sumInside.Free;
    if Assigned(Fmm9countInside) then
      mm9countInside.Free;
    if Assigned(Fmm9sumInside) then
      mm9sumInside.Free;
    if Assigned(Fmm10countInside) then
      mm10countInside.Free;
    if Assigned(Fmm10sumInside) then
      mm10sumInside.Free;
    if Assigned(Fmm11countInside) then
      mm11countInside.Free;
    if Assigned(Fmm11sumInside) then
      mm11sumInside.Free;
    if Assigned(Fmm12countInside) then
      mm12countInside.Free;
    if Assigned(Fmm12sumInside) then
      mm12sumInside.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FipRefDateAdd) then
      ipRefDateAdd.Free;
    if Assigned(FipRefDateEdit) then
      ipRefDateEdit.Free;
    if Assigned(FparentRefCountGen) then
      parentRefCountGen.Free;
    if Assigned(FparentRefPrice) then
      parentRefPrice.Free;
    if Assigned(FparentRefSumGen) then
      parentRefSumGen.Free;
    if Assigned(FparentRefQuarter1count) then
      parentRefQuarter1count.Free;
    if Assigned(FparentRefQuarter1sum) then
      parentRefQuarter1sum.Free;
    if Assigned(FparentRefQuarter2count) then
      parentRefQuarter2count.Free;
    if Assigned(FparentRefQuarter2sum) then
      parentRefQuarter2sum.Free;
    if Assigned(FparentRefQuarter3count) then
      parentRefQuarter3count.Free;
    if Assigned(FparentRefQuarter3sum) then
      parentRefQuarter3sum.Free;
    if Assigned(FparentRefQuarter4count) then
      parentRefQuarter4count.Free;
    if Assigned(FparentRefQuarter4sum) then
      parentRefQuarter4sum.Free;
    if Assigned(FparentRefCountGenInside) then
      parentRefCountGenInside.Free;
    if Assigned(FparentRefPriceInside) then
      parentRefPriceInside.Free;
    if Assigned(FparentRefSumGenInside) then
      parentRefSumGenInside.Free;
    if Assigned(FparentRefMm1countInside) then
      parentRefMm1countInside.Free;
    if Assigned(FparentRefMm1sumInside) then
      parentRefMm1sumInside.Free;
    if Assigned(FparentRefMm2countInside) then
      parentRefMm2countInside.Free;
    if Assigned(FparentRefMm2sumInside) then
      parentRefMm2sumInside.Free;
    if Assigned(FparentRefMm3countInside) then
      parentRefMm3countInside.Free;
    if Assigned(FparentRefMm3sumInside) then
      parentRefMm3sumInside.Free;
    if Assigned(FparentRefMm4countInside) then
      parentRefMm4countInside.Free;
    if Assigned(FparentRefMm4sumInside) then
      parentRefMm4sumInside.Free;
    if Assigned(FparentRefMm5countInside) then
      parentRefMm5countInside.Free;
    if Assigned(FparentRefMm5sumInside) then
      parentRefMm5sumInside.Free;
    if Assigned(FparentRefMm6countInside) then
      parentRefMm6countInside.Free;
    if Assigned(FparentRefMm6sumInside) then
      parentRefMm6sumInside.Free;
    if Assigned(FparentRefMm7countInside) then
      parentRefMm7countInside.Free;
    if Assigned(FparentRefMm7sumInside) then
      parentRefMm7sumInside.Free;
    if Assigned(FparentRefMm8countInside) then
      parentRefMm8countInside.Free;
    if Assigned(FparentRefMm8sumInside) then
      parentRefMm8sumInside.Free;
    if Assigned(FparentRefMm9countInside) then
      parentRefMm9countInside.Free;
    if Assigned(FparentRefMm9sumInside) then
      parentRefMm9sumInside.Free;
    if Assigned(FparentRefMm10countInside) then
      parentRefMm10countInside.Free;
    if Assigned(FparentRefMm10sumInside) then
      parentRefMm10sumInside.Free;
    if Assigned(FparentRefMm11countInside) then
      parentRefMm11countInside.Free;
    if Assigned(FparentRefMm11sumInside) then
      parentRefMm11sumInside.Free;
    if Assigned(FparentRefMm12countInside) then
      parentRefMm12countInside.Free;
    if Assigned(FparentRefMm12sumInside) then
      parentRefMm12sumInside.Free;
    if Assigned(FparentRefDateAdd) then
      parentRefDateAdd.Free;
    if Assigned(FparentRefDateEdit) then
      parentRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor ENIPItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENIPItem, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPItem');
  RemClassRegistry.RegisterXSClass(ENIPItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPItemRef');
  RemClassRegistry.RegisterXSClass(ENIPItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPItemFilter');
  RemClassRegistry.RegisterXSClass(ENIPItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPItemShort');
  RemClassRegistry.RegisterXSClass(ENIPItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENIPItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENIPItemShort');

  InvRegistry.RegisterInterface(TypeInfo(ENIPItemControllerSoapPort), 'http://ksoe.org/ENIPItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENIPItemControllerSoapPort), 'http://ksoe.org/ENIPItemController/action/ENIPItemController.%operationName%');


end.
