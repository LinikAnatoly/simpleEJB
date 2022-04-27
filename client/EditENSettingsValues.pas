
unit EditENSettingsValues;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSettingsValuesController ;

type
  TfrmENSettingsValuesEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblDateStart : TLabel;
    edtDateStart: TDateTimePicker;
    lblDateFinal : TLabel;
    edtDateFinal: TDateTimePicker;
    lblValue : TLabel;
    edtValue: TMemo;
    lblUserAdd : TLabel;
    edtUserAdd: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TMemo;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENSettingsValues: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENSettingsValuesEdit: TfrmENSettingsValuesEdit;
  ENSettingsValuesObj: ENSettingsValues;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSettingsValuesController  ;
}
{$R *.dfm}



procedure TfrmENSettingsValuesEdit.FormShow(Sender: TObject);

begin

  DisableControls([edtCode, edtUserAdd, edtUserGen, edtDateEdit]);
  if DialogState = dsView then
  begin

  end;

  if DialogState = dsInsert then begin
    HideControls([edtCode, edtUserAdd, edtUserGen, edtDateEdit, lblCode, lblUserAdd
    , lblUserGen, lblDateEdit]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtValue
      ,edtDateStart
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENSettingsValuesObj.code);
      SetDateFieldForDateTimePicker(edtDateStart, ENSettingsValuesObj.dateStart);
      SetDateFieldForDateTimePicker(edtDateFinal, ENSettingsValuesObj.dateFinal);
    MakeMultiline(edtValue.Lines, ENSettingsValuesObj.value);
    edtUserAdd.Text := ENSettingsValuesObj.userAdd; 
    MakeMultiline(edtCommentGen.Lines, ENSettingsValuesObj.commentGen);
    edtUserGen.Text := ENSettingsValuesObj.userGen; 
      SetDateFieldForDateTimePicker(edtDateEdit, ENSettingsValuesObj.dateEdit);


  end;
end;



procedure TfrmENSettingsValuesEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSettingsValues: ENSettingsValuesControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtValue, edtDateStart
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENSettingsValues := HTTPRIOENSettingsValues as ENSettingsValuesControllerSoapPort;


     ENSettingsValuesObj.dateStart := GetTXSDateFromTDateTimePicker(edtdateStart);

     ENSettingsValuesObj.dateFinal := GetTXSDateFromTDateTimePicker(edtdateFinal);

     ENSettingsValuesObj.value := Trim(edtValue.Text);

     ENSettingsValuesObj.commentGen := Trim(edtCommentGen.Text);


    if DialogState = dsInsert then
    begin
      ENSettingsValuesObj.code:=low(Integer);
      TempENSettingsValues.add(ENSettingsValuesObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSettingsValues.save(ENSettingsValuesObj);
    end;
  end;
end;


end.