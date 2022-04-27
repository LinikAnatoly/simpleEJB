
unit EditENPlanWorkReason;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanWorkReasonController ;

type
  TfrmENPlanWorkReasonEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    lblNumberGen : TLabel;
    edtNumberGen: TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TMemo;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;
    lblUserGen : TLabel;
    edtUserGen: TEdit;

  lblENManagementManagementName : TLabel;
  edtENManagementManagementName : TEdit;
  spbENManagementManagement : TSpeedButton;
  
  lblENPlanWorkReasonTypeReasonTypeName : TLabel;
  edtENPlanWorkReasonTypeReasonTypeName : TEdit;
  spbENPlanWorkReasonTypeReasonType : TSpeedButton;
  

  HTTPRIOENPlanWorkReason: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENManagementManagementClick(Sender : TObject);
  procedure spbENPlanWorkReasonTypeReasonTypeClick(Sender : TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENPlanWorkReasonEdit: TfrmENPlanWorkReasonEdit;
  ENPlanWorkReasonObj: ENPlanWorkReason;

implementation

uses
  ShowENManagement
  ,ENManagementController
  ,ShowENPlanWorkReasonType
  ,ENPlanWorkReasonTypeController
;

{uses  
    EnergyproController, EnergyproController2, ENPlanWorkReasonController  ;
}
{$R *.dfm}



procedure TfrmENPlanWorkReasonEdit.FormShow(Sender: TObject);

begin

  DisableControls([ edtENPlanWorkReasonTypeReasonTypeName ,edtENManagementManagementName] );

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      spbENManagementManagement
      ,spbENPlanWorkReasonTypeReasonType
       ]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtDateGen
      ,edtNumberGen
      ,edtName
      ,edtENPlanWorkReasonTypeReasonTypeName
      ,edtENManagementManagementName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENPlanWorkReasonObj.code);
      if ENPlanWorkReasonObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENPlanWorkReasonObj.dateGen.Year,ENPlanWorkReasonObj.dateGen.Month,ENPlanWorkReasonObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;
    edtNumberGen.Text := ENPlanWorkReasonObj.numberGen; 
    edtName.Text := ENPlanWorkReasonObj.name; 
    MakeMultiline(edtCommentGen.Lines, ENPlanWorkReasonObj.commentGen);
      if ENPlanWorkReasonObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENPlanWorkReasonObj.dateEdit.Year,ENPlanWorkReasonObj.dateEdit.Month,ENPlanWorkReasonObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;
    edtUserGen.Text := ENPlanWorkReasonObj.userGen; 

    edtENManagementManagementName.Text := ENPlanWorkReasonObj.management.name;
    edtENPlanWorkReasonTypeReasonTypeName.Text := ENPlanWorkReasonObj.reasonType.name;

  end;
end;



procedure TfrmENPlanWorkReasonEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanWorkReason: ENPlanWorkReasonControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtNumberGen
      ,edtDateGen
      ,edtName
      ,edtENPlanWorkReasonTypeReasonTypeName
      ,edtENManagementManagementName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENPlanWorkReason := HTTPRIOENPlanWorkReason as ENPlanWorkReasonControllerSoapPort;


     if edtdateGen.checked then
     begin 
       if ENPlanWorkReasonObj.dateGen = nil then
          ENPlanWorkReasonObj.dateGen := TXSDate.Create;
       ENPlanWorkReasonObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENPlanWorkReasonObj.dateGen := nil;

     ENPlanWorkReasonObj.numberGen := edtNumberGen.Text; 

     ENPlanWorkReasonObj.name := edtName.Text; 

     ENPlanWorkReasonObj.commentGen := edtCommentGen.Text; 

     if edtdateEdit.checked then
     begin 
       if ENPlanWorkReasonObj.dateEdit = nil then
          ENPlanWorkReasonObj.dateEdit := TXSDateTime.Create;
       ENPlanWorkReasonObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENPlanWorkReasonObj.dateEdit := nil;	   

     ENPlanWorkReasonObj.userGen := edtUserGen.Text; 

    if DialogState = dsInsert then
    begin
      ENPlanWorkReasonObj.code:=low(Integer);
      TempENPlanWorkReason.add(ENPlanWorkReasonObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENPlanWorkReason.save(ENPlanWorkReasonObj);
    end;
  end;
end;


procedure TfrmENPlanWorkReasonEdit.spbENManagementManagementClick(Sender : TObject);
var 
   frmENManagementShow: TfrmENManagementShow;
begin
   frmENManagementShow:=TfrmENManagementShow.Create(Application,fmNormal);
   try
      with frmENManagementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPlanWorkReasonObj.management = nil then ENPlanWorkReasonObj.management := ENManagement.Create();
               ENPlanWorkReasonObj.management.code := StrToInt(GetReturnValue(sgENManagement,0));
               edtENManagementManagementName.Text:=GetReturnValue(sgENManagement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENManagementShow.Free;
   end;
end;



procedure TfrmENPlanWorkReasonEdit.spbENPlanWorkReasonTypeReasonTypeClick(Sender : TObject);
var 
   frmENPlanWorkReasonTypeShow: TfrmENPlanWorkReasonTypeShow;
begin
   frmENPlanWorkReasonTypeShow:=TfrmENPlanWorkReasonTypeShow.Create(Application,fmNormal);
   try
      with frmENPlanWorkReasonTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPlanWorkReasonObj.reasonType = nil then ENPlanWorkReasonObj.reasonType := ENPlanWorkReasonType.Create();
               ENPlanWorkReasonObj.reasonType.code := StrToInt(GetReturnValue(sgENPlanWorkReasonType,0));
               edtENPlanWorkReasonTypeReasonTypeName.Text:=GetReturnValue(sgENPlanWorkReasonType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENPlanWorkReasonTypeShow.Free;
   end;
end;



end.