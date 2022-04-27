
unit EditENSOValues;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSOValuesController ;

type
  TfrmENSOValuesEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblDateVal : TLabel;
    edtDateVal: TDateTimePicker;
    lblStrVal : TLabel;
    edtStrVal: TMemo;


  HTTPRIOENSOValues: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    spbENSOValuesType: TSpeedButton;
    Label1: TLabel;
    edtSOValuesTypeName: TEdit;
    spbSOValuesTypeClear: TSpeedButton;
    HTTPRIOENSOValuesType: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENSOValuesTypeClick(Sender: TObject);
    procedure spbSOValuesTypeClearClick(Sender: TObject);
  
  
  private
    { Private declarations }
    function validateValue(): Boolean;
  public
    { Public declarations }

end;

var
  frmENSOValuesEdit: TfrmENSOValuesEdit;
  ENSOValuesObj: ENSOValues;

implementation

uses ShowENSOValuesType, ENSOValuesTypeController, ENConsts;


{uses  
    EnergyproController, EnergyproController2, ENSOValuesController  ;
}
{$R *.dfm}



procedure TfrmENSOValuesEdit.FormShow(Sender: TObject);
var
  TempENSOValuesType: ENSOValuesTypeControllerSoapPort;
  ENSOValuesTypeObj : ENSOValuesType;
begin

     DisableControls([edtCode]);

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtSOValuesTypeName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

     TempENSOValuesType := HTTPRIOENSOValuesType as ENSOValuesTypeControllerSoapPort;

     ENSOValuesTypeObj := TempENSOValuesType.getObject(ENSOValuesObj.soValuesType.code);
     edtSOValuesTypeName.Text := ENSOValuesTypeObj.name;

      edtCode.Text := IntToStr(ENSOValuesObj.code);
      SetDateFieldForDateTimePicker(edtDateVal, ENSOValuesObj.dateVal);
      MakeMultiline(edtStrVal.Lines, ENSOValuesObj.strVal);
  end;


end;



procedure TfrmENSOValuesEdit.spbENSOValuesTypeClick(Sender: TObject);
var
   frmENSOValuesTypeShow : TfrmENSOValuesTypeShow;
begin
   frmENSOValuesTypeShow:=TfrmENSOValuesTypeShow.Create(Application,fmNormal);
   try
      with frmENSOValuesTypeShow do begin

        if ShowModal = mrOk then
        begin
            try
               edtSOValuesTypeName.Text := GetReturnValue(sgENSOValuesType,1);
               if  ENSOValuesObj.soValuesType = nil then
                ENSOValuesObj.soValuesType := ENSOValuesTypeRef.Create;
               ENSOValuesObj.soValuesType.code := StrToInt(GetReturnValue(sgENSOValuesType,0));
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENSOValuesTypeShow.Free;
   end;
end;

procedure TfrmENSOValuesEdit.spbSOValuesTypeClearClick(Sender: TObject);
begin
  inherited;
  ENSOValuesObj.soValuesType := nil;
  edtSOValuesTypeName.Text := '';
end;

function TfrmENSOValuesEdit.validateValue: Boolean;
  procedure showErrorMessage();
  begin
    if ENSOValuesObj.soValuesType.code = ENSOVALUESTYPE_LAND_SHEET_STAGE_NUMBER then
      Application.MessageBox(PChar('Для цього реквізиту припустимий такий діапазон значень: 1 - 5 !'),
                             PChar('Увага !'), MB_ICONWARNING + MB_OK);
    if edtStrVal.CanFocus then
      edtStrVal.SetFocus;
  end;

var
  intValue: Integer;
begin
  if ENSOValuesObj.soValuesType.code = ENSOVALUESTYPE_LAND_SHEET_STAGE_NUMBER then
  begin
    Result := false;

    if ENSOValuesObj = nil then Exit;
    if ENSOValuesObj.soValuesType = nil then Exit;
    if ENSOValuesObj.strVal = '' then
    begin
      Application.MessageBox(PChar('Введіть текстове значення реквізиту (1 - 5) !'),
                             PChar('Увага !'), MB_ICONWARNING + MB_OK);
      if edtStrVal.CanFocus then
        edtStrVal.SetFocus;
      Exit;
    end;

    try
      intValue := StrToInt(ENSOValuesObj.strVal);
    except
      on EConvertError do
      begin
        showErrorMessage();
        Exit;
      end;
    end;

    if (intValue < 1) or (intValue > 5) then
    begin
      Result := false;
      showErrorMessage();
    end
    else
      Result := true;
  end else
    Result := true;
end;

procedure TfrmENSOValuesEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSOValues: ENSOValuesControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtSOValuesTypeName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    ENSOValuesObj.dateVal := GetTXSDateTimeFromTDateTimePicker(edtdateVal);
    ENSOValuesObj.strVal := edtStrVal.Text;

    if not validateValue then
    begin
      Action := caNone;
      Exit;
    end;

    TempENSOValues := HTTPRIOENSOValues as ENSOValuesControllerSoapPort;

    if DialogState = dsInsert then
    begin
      ENSOValuesObj.code:=low(Integer);
      TempENSOValues.add(ENSOValuesObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSOValues.save(ENSOValuesObj);
    end;
  end;
end;


end.