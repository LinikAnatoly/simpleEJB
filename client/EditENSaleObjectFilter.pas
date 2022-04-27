
unit EditENSaleObjectFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,     
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENServicesObjectController ;

type
  TfrmENSaleObjectFilterEdit = class(TDialogForm)
    lblName : TLabel;
    edtContragentName: TEdit;

    lblContractNumberServices : TLabel;
    edtContractNumberServices: TEdit;

    lblContractDateServices : TLabel;
  

  HTTPRIOENServicesObject: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    edtContractDateServicesFrom: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    cbContractStatus: TComboBox;
    cbStatus: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    edtContractDateServicesTo: TDateTimePicker;
    lblContragentOkpo: TLabel;
    edtContragentOkpo: TEdit;
    GroupBox1: TGroupBox;
    lblContractNumber: TLabel;
    edtContractNumber: TEdit;
    lblContractDate: TLabel;
    Label5: TLabel;
    edtContractDateFrom: TDateTimePicker;
    Label6: TLabel;
    edtContractDateTo: TDateTimePicker;
    lblPartnerCode: TLabel;
    lblFinDocCode: TLabel;
    lblFinDocID: TLabel;
    lblCommentGen: TLabel;
    edtPartnerCode: TEdit;
    edtFinDocCode: TEdit;
    edtFinDocID: TEdit;
    edtCommentGen: TEdit;
    lblENDepartmentDepartmentName: TLabel;
    edtENDepartmentDepartmentName: TEdit;
    spbENDepartmentDepartment: TSpeedButton;
    lblContragentAddress: TLabel;
    edtContragentAddress: TEdit;
    lblInfo: TLabel;
    Label7: TLabel;
    edtTKFINWorkType: TEdit;
    spbTKFINWorkType: TSpeedButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENDepartmentDepartmentClick(Sender : TObject);
    procedure spbTKFINWorkTypeClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

    finWorkType : Integer;

end;

var
  frmENSaleObjectFilterEdit: TfrmENSaleObjectFilterEdit;
  ENServicesObjectFilterObj: ENServicesObjectFilter;

implementation

uses
  ShowENDepartment
  ,ENDepartmentController
  ,ShowENElement
  ,ENElementController
, ENServicesContractStatusController, ENServicesObjectStatusController, 
  ShowTKFINWorkType;

{uses  
    EnergyproController, EnergyproController2, ENServicesObjectController  ;
}
{$R *.dfm}



procedure TfrmENSaleObjectFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtContractNumber
      ,edtContractDate
      ,edtName
      ,edtPartnerCode
      ,edtFinDocCode
      ,edtFinDocID
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtContractNumber.Text := ENServicesObjectObj.contractNumber; 



      if ENServicesObjectObj.contractDate <> nil then
      begin
        edtContractDate.DateTime:=EncodeDate(ENServicesObjectObj.contractDate.Year,ENServicesObjectObj.contractDate.Month,ENServicesObjectObj.contractDate.Day);
        edtContractDate.checked := true;
      end
      else
      begin
        edtContractDate.DateTime:=SysUtils.Date;
        edtContractDate.checked := false;
      end;



    edtName.Text := ENServicesObjectObj.name; 



    edtPartnerCode.Text := ENServicesObjectObj.partnerCode; 



    edtFinDocCode.Text := ENServicesObjectObj.finDocCode; 



    if ( ENServicesObjectObj.finDocID <> Low(Integer) ) then
       edtFinDocID.Text := IntToStr(ENServicesObjectObj.finDocID)
    else
       edtFinDocID.Text := '';



    MakeMultiline(edtCommentGen.Lines, ENServicesObjectObj.commentGen);



    edtContractNumberServices.Text := ENServicesObjectObj.contractNumberServices; 



      if ENServicesObjectObj.contractDateServices <> nil then
      begin
        edtContractDateServices.DateTime:=EncodeDate(ENServicesObjectObj.contractDateServices.Year,ENServicesObjectObj.contractDateServices.Month,ENServicesObjectObj.contractDateServices.Day);
        edtContractDateServices.checked := true;
      end
      else
      begin
        edtContractDateServices.DateTime:=SysUtils.Date;
        edtContractDateServices.checked := false;
      end;



    edtContragentName.Text := ENServicesObjectObj.contragentName; 



    MakeMultiline(edtContragentAddress.Lines, ENServicesObjectObj.contragentAddress);



    edtContragentOkpo.Text := ENServicesObjectObj.contragentOkpo;



    edtContragentBankAccount.Text := ENServicesObjectObj.contragentBankAccount; 



    edtContragentBankName.Text := ENServicesObjectObj.contragentBankName; 



    edtContragentBankMfo.Text := ENServicesObjectObj.contragentBankMfo; 



    edtContragentBossName.Text := ENServicesObjectObj.contragentBossName; 



    MakeMultiline(edtContragentPassport.Lines, ENServicesObjectObj.contragentPassport);



    if ( ENServicesObjectObj.contractServicesSumma <> nil ) then
       edtContractServicesSumma.Text := ENServicesObjectObj.contractServicesSumma.decimalString
    else
       edtContractServicesSumma.Text := ''; 



    if ( ENServicesObjectObj.contractServicesPower <> nil ) then
       edtContractServicesPower.Text := ENServicesObjectObj.contractServicesPower.decimalString
    else
       edtContractServicesPower.Text := ''; 



    MakeMultiline(edtCommentServicesGen.Lines, ENServicesObjectObj.commentServicesGen);



    if ( ENServicesObjectObj.contractServicesDistance <> nil ) then
       edtContractServicesDistance.Text := ENServicesObjectObj.contractServicesDistance.decimalString
    else
       edtContractServicesDistance.Text := ''; 



    if ( ENServicesObjectObj.contractServicesDay <> nil ) then
       edtContractServicesDay.Text := ENServicesObjectObj.contractServicesDay.decimalString
    else
       edtContractServicesDay.Text := ''; 



    edtUserGen.Text := ENServicesObjectObj.userGen; 



      if ENServicesObjectObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENServicesObjectObj.dateEdit.Year,ENServicesObjectObj.dateEdit.Month,ENServicesObjectObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;


  end;

}

end;



procedure TfrmENSaleObjectFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENServicesObject: ENServicesObjectControllerSoapPort;
var condition: String;
begin
  if (ModalResult = mrOk)  then
  begin
     condition := '';

     ENServicesObjectFilterObj.contractNumber := edtContractNumber.Text;

     {
     if edtcontractDate.checked then
     begin
       if ENServicesObjectFilterObj.contractDate = nil then
          ENServicesObjectFilterObj.contractDate := TXSDate.Create;
       ENServicesObjectFilterObj.contractDate.XSToNative(GetXSDate(edtcontractDate.DateTime));
     end
     else
       ENServicesObjectFilterObj.contractDate := nil;
     }
     if edtContractDateFrom.Checked then
     begin
       AddCondition(condition, ' ENSERVICESOBJECT.CONTRACTDATE >= to_date(''' + DateToStr(edtContractDateFrom.Date) + ''', ''dd.MM.yyyy'')');
     end;

     if edtContractDateTo.Checked then
     begin
       AddCondition(condition, ' ENSERVICESOBJECT.CONTRACTDATE <= to_date(''' + DateToStr(edtContractDateTo.Date) + ''', ''dd.MM.yyyy'')');
     end;

     //ENServicesObjectFilterObj.name := edtName.Text;
     ENServicesObjectFilterObj.contragentName := edtContragentName.Text;

     ENServicesObjectFilterObj.partnerCode := edtPartnerCode.Text;

     ENServicesObjectFilterObj.finDocCode := edtFinDocCode.Text;

     if ( edtFinDocID.Text <> '' ) then
       ENServicesObjectFilterObj.finDocID := StrToInt(edtFinDocID.Text)
     else
       ENServicesObjectFilterObj.finDocID := Low(Integer) ;

     ENServicesObjectFilterObj.commentGen := edtCommentGen.Text;

     ENServicesObjectFilterObj.contractNumberServices := edtContractNumberServices.Text;

     ENServicesObjectFilterObj.contragentAddress := edtContragentAddress.Text;

     {
     if edtContractDateServices.checked then
     begin
       if ENServicesObjectFilterObj.contractDateServices = nil then
          ENServicesObjectFilterObj.contractDateServices := TXSDate.Create;
       ENServicesObjectFilterObj.contractDateServices.XSToNative(GetXSDate(edtContractDateServices.DateTime));
     end
     else
       ENServicesObjectFilterObj.contractDateServices := nil;
     }
     if edtContractDateServicesFrom.Checked then
     begin
       AddCondition(condition, ' ENSERVICESOBJECT.CONTRACTDATESERVICES >= to_date(''' + DateToStr(edtContractDateServicesFrom.Date) + ''', ''dd.MM.yyyy'')');
     end;

     if edtContractDateServicesTo.Checked then
     begin
       AddCondition(condition, ' ENSERVICESOBJECT.CONTRACTDATESERVICES <= to_date(''' + DateToStr(edtContractDateServicesTo.Date) + ''', ''dd.MM.yyyy'')');
     end;

     ENServicesObjectFilterObj.contragentOkpo := edtContragentOkpo.Text;

     if cbContractStatus.ItemIndex > 0 then
     begin
       ENServicesObjectFilterObj.contractStatusRef := ENServicesContractStatusRef.Create;
       ENServicesObjectFilterObj.contractStatusRef.code := cbContractStatus.ItemIndex;
     end
     else
       ENServicesObjectFilterObj.contractStatusRef := nil;

     if cbStatus.ItemIndex > 0 then
     begin
       ENServicesObjectFilterObj.statusRef := ENServicesObjectStatusRef.Create;
       ENServicesObjectFilterObj.statusRef.code := cbStatus.ItemIndex;
     end
     else
       ENServicesObjectFilterObj.statusRef := nil;

     ENServicesObjectFilterObj.conditionSQL := condition;
  end;
end;

procedure TfrmENSaleObjectFilterEdit.spbENDepartmentDepartmentClick(Sender : TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin

  f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   //f.typeRef := ENDepartmentTypeRef.Create;
   //f.typeRef.code := 0; // предприятие ХОЕ ... ENDEPARTMENTTYPE_DEPARTMENT;
   //f.conditionSQL := ' parentrefcode is null';
   //f.conditionSQL :=

   f.code := 1;

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      frmENDepartmentShow.isShowAll := true;
      with frmENDepartmentShow do begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               if ENServicesObjectFilterObj.department = nil then ENServicesObjectFilterObj.department := ENDepartment.Create();
               ENServicesObjectFilterObj.department.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentDepartmentName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

{
var 
   frmENDepartmentShow: TfrmENDepartmentShow;
begin
   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal);
   try
      with frmENDepartmentShow do
        if ShowModal = mrOk then
        begin
            try
               if ENServicesObjectFilterObj.department = nil then ENServicesObjectFilterObj.department := ENDepartment.Create();
               //ENServicesObjectFilterObj.department.code := StrToInt(GetReturnValue(sgENDepartment,0));
               //edtENDepartmentDepartmentName.Text:=GetReturnValue(sgENDepartment,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENDepartmentShow.Free;
   end;
}
end;


procedure TfrmENSaleObjectFilterEdit.spbTKFINWorkTypeClick(
  Sender: TObject);
var 
   frmTKFINWorkTypeShow: TfrmTKFINWorkTypeShow;
begin
   frmTKFINWorkTypeShow:=TfrmTKFINWorkTypeShow.Create(Application,fmNormal);
   try
      frmTKFINWorkTypeShow.DisableActions([frmTKFINWorkTypeShow.actInsert,
                                           frmTKFINWorkTypeShow.actEdit,
                                           frmTKFINWorkTypeShow.actDelete]);   
      with frmTKFINWorkTypeShow do
        if ShowModal = mrOk then
        begin
            try
               finWorkType:= StrToInt(GetReturnValue(sgTKFINWorkType,0));
               edtTKFINWorkType.Text:= GetReturnValue(sgTKFINWorkType,2);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKFINWorkTypeShow.Free;
   end;
end;

end.
