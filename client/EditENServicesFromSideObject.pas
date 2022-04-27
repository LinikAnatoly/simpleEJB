
unit EditENServicesFromSideObject;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	  EnergyproController, EnergyproController2, ENServicesFromSideObjectController,
    ENConsts;

type
  TfrmENServicesFromSideObjectEdit = class(TDialogForm)
  
    lblCode : TLabel;
	  edtCode : TEdit;
    edtContractNumber: TEdit;
    edtContractDate: TDateTimePicker;
    edtName: TEdit;
    lblPartnerCode : TLabel;
    edtPartnerCode: TEdit;
    lblFinDocCode : TLabel;
    edtFinDocCode: TEdit;
    lblFinDocID : TLabel;
    edtFinDocID: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TMemo;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

  lblENDepartmentDepartmentName : TLabel;
  edtENDepartmentDepartmentName : TEdit;
  spbENDepartmentDepartment : TSpeedButton;
  
  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENServicesFromSideObject: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    spbContractNumberSelect: TSpeedButton;
    lblName: TLabel;
    lblContractNumber: TLabel;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENDepartmentDepartmentClick(Sender : TObject);
  procedure spbENElementElementClick(Sender : TObject);
    procedure spbContractNumberSelectClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENServicesFromSideObjectEdit: TfrmENServicesFromSideObjectEdit;
  ENServicesFromSideObjectObj: ENServicesFromSideObject;

implementation

uses
  ShowENDepartment
  ,ENDepartmentController
  ,ShowENElement
  ,ENElementController
  ,ShowFINServicesObject
  ,ENServicesObjectController
;

{uses  
    EnergyproController, EnergyproController2, ENServicesFromSideObjectController  ;
}
{$R *.dfm}



procedure TfrmENServicesFromSideObjectEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
    DisableControls([
      edtENDepartmentDepartmentName
      ,spbENDepartmentDepartment
      ,edtENElementElementName
      ,spbENElementElement]);

    DisableControls([edtCode, edtContractDate, edtContractNumber,
            edtPartnerCode, edtFinDocCode, edtFinDocID, spbContractNumberSelect]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DisableControls([edtCode, edtContractDate, edtContractNumber, 
            edtPartnerCode, edtFinDocCode, edtFinDocID, spbContractNumberSelect]);
    DenyBlankValues([edtCommentGen, edtName]);
  end;

  if (DialogState = dsInsert) then DisableControls([spbContractNumberSelect], False);

  // при редактировании лочим всегда
  // договор изменится при редактировании заявки
  // if (DialogState = dsEdit) then
  // DisableControls([spbContractNumberSelect], ENServicesFromSideObjectObj.finDocID <> Low_int);

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    DisableControls([edtName]);

    edtCode.Text := IntToStr(ENServicesFromSideObjectObj.code);
    edtContractNumber.Text := ENServicesFromSideObjectObj.contractNumber;

    if ENServicesFromSideObjectObj.contractDate <> nil then
    begin
      edtContractDate.DateTime:=EncodeDate(ENServicesFromSideObjectObj.contractDate.Year,ENServicesFromSideObjectObj.contractDate.Month,ENServicesFromSideObjectObj.contractDate.Day);
      edtContractDate.checked := true;
    end
    else
    begin
      edtContractDate.DateTime:=SysUtils.Date;
      edtContractDate.checked := false;
    end;

    edtName.Text := ENServicesFromSideObjectObj.name;
    edtPartnerCode.Text := ENServicesFromSideObjectObj.partnerCode; 
    edtFinDocCode.Text := ENServicesFromSideObjectObj.finDocCode; 

    if ( ENServicesFromSideObjectObj.finDocID <> Low(Integer) ) then
       edtFinDocID.Text := IntToStr(ENServicesFromSideObjectObj.finDocID)
    else
       edtFinDocID.Text := '';

    MakeMultiline(edtCommentGen.Lines, ENServicesFromSideObjectObj.commentGen);
    edtUserGen.Text := ENServicesFromSideObjectObj.userGen; 

    if ENServicesFromSideObjectObj.dateEdit <> nil then
    begin
      edtDateEdit.DateTime:=EncodeDate(ENServicesFromSideObjectObj.dateEdit.Year,ENServicesFromSideObjectObj.dateEdit.Month,ENServicesFromSideObjectObj.dateEdit.Day);
      edtDateEdit.checked := true;
    end
    else
    begin
      edtDateEdit.DateTime:=SysUtils.Date;
      edtDateEdit.checked := false;
    end;

    edtENDepartmentDepartmentName.Text := ENServicesFromSideObjectObj.department.name;
    //edtENElementElementName.Text := ENServicesFromSideObjectObj.element.name;

  end;
end;



procedure TfrmENServicesFromSideObjectEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENServicesFromSideObject: ENServicesFromSideObjectControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtName, edtCommentGen]) then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENServicesFromSideObject := HTTPRIOENServicesFromSideObject as ENServicesFromSideObjectControllerSoapPort;


     ENServicesFromSideObjectObj.contractNumber := edtContractNumber.Text; 

     if edtcontractDate.checked then
     begin 
       if ENServicesFromSideObjectObj.contractDate = nil then
          ENServicesFromSideObjectObj.contractDate := TXSDate.Create;
       ENServicesFromSideObjectObj.contractDate.XSToNative(GetXSDate(edtcontractDate.DateTime));
     end
     else
       ENServicesFromSideObjectObj.contractDate := nil;

     ENServicesFromSideObjectObj.name := edtName.Text; 

     ENServicesFromSideObjectObj.partnerCode := edtPartnerCode.Text; 

     ENServicesFromSideObjectObj.finDocCode := edtFinDocCode.Text; 

     if ( edtFinDocID.Text <> '' ) then
       ENServicesFromSideObjectObj.finDocID := StrToInt(edtFinDocID.Text)
     else
       ENServicesFromSideObjectObj.finDocID := Low(Integer) ;

     ENServicesFromSideObjectObj.commentGen := edtCommentGen.Text; 

     ENServicesFromSideObjectObj.userGen := edtUserGen.Text; 

     if edtdateEdit.checked then
     begin 
       if ENServicesFromSideObjectObj.dateEdit = nil then
          ENServicesFromSideObjectObj.dateEdit := TXSDate.Create;
       ENServicesFromSideObjectObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENServicesFromSideObjectObj.dateEdit := nil;

    if DialogState = dsInsert then
    begin
      ENServicesFromSideObjectObj.code:=low(Integer);
      TempENServicesFromSideObject.add(ENServicesFromSideObjectObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENServicesFromSideObject.save(ENServicesFromSideObjectObj);
    end;
  end;
end;


procedure TfrmENServicesFromSideObjectEdit.spbENDepartmentDepartmentClick(Sender : TObject);
var 
   frmENDepartmentShow: TfrmENDepartmentShow;
begin
   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal);
   try
      with frmENDepartmentShow do
        if ShowModal = mrOk then
        begin
            try
               if ENServicesFromSideObjectObj.department = nil then ENServicesFromSideObjectObj.department := ENDepartment.Create();
               //ENServicesFromSideObjectObj.department.code := StrToInt(GetReturnValue(sgENDepartment,0));
//               /edtENDepartmentDepartmentName.Text:=GetReturnValue(sgENDepartment,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENDepartmentShow.Free;
   end;
end;



procedure TfrmENServicesFromSideObjectEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENServicesFromSideObjectObj.element = nil then ENServicesFromSideObjectObj.element := ENElement.Create();
               ENServicesFromSideObjectObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;



procedure TfrmENServicesFromSideObjectEdit.spbContractNumberSelectClick(
  Sender: TObject);
var
   frmFINServicesObjectShow: TfrmFINServicesObjectShow;
   f : ENServicesObjectFilter;
begin
   f := ENServicesObjectFilter.Create();
   SetNullXSProps(f);
   SetNullIntProps(f);

   if (edtContractNumber.Text <> '') then
     f.contractNumber := edtContractNumber.Text
   else
     f.contractNumber := '-1';

   //f.conditionSQL := 'a.io_flag = ''B'' and a.agree_group_id in (' + AGREES_GROUPS_IDS + ')';
   f.conditionSQL := 'a.io_flag = ''B''';

   frmFINServicesObjectShow:=TfrmFINServicesObjectShow.Create(Application,fmNormal, f);
   frmFINServicesObjectShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
   try
      with frmFINServicesObjectShow do
        if ShowModal = mrOk then
        begin
            try
                edtContractNumber.Text := GetReturnValue(sgFINServicesObject, 1);
                edtContractDate.DateTime := StrToDate(GetReturnValue(sgFINServicesObject, 2));
                edtContractDate.Checked := true;
                edtName.Text := GetReturnValue(sgFINServicesObject, 3);
                edtPartnerCode.Text := GetReturnValue(sgFINServicesObject, 4);
                edtFinDocCode.Text :=  GetReturnValue(sgFINServicesObject, 5);
                edtFinDocID.Text :=  GetReturnValue(sgFINServicesObject, 6);
                edtCommentGen.Text :=  GetReturnValue(sgFINServicesObject, 7);

                DisableControls([edtName, edtCommentGen]);

            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINServicesObjectShow.Free;
   end;
end;


end.