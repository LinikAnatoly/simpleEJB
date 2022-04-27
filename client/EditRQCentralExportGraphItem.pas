
unit EditRQCentralExportGraphItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQCentralExportGraphItemController ;

type
  TfrmRQCentralExportGraphItemEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;


  HTTPRIORQCentralExportGraphItem: THTTPRIO;

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
  frmRQCentralExportGraphItemEdit: TfrmRQCentralExportGraphItemEdit;
  RQCentralExportGraphItemObj: RQCentralExportGraphItem;

implementation


{uses  
    EnergyproController, EnergyproController2, RQCentralExportGraphItemController  ;
}
{$R *.dfm}



procedure TfrmRQCentralExportGraphItemEdit.FormShow(Sender: TObject);

begin

   DisableControls([edtCode]);

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtDateGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(RQCentralExportGraphItemObj.code);
      SetDateFieldForDateTimePicker(edtDateGen, RQCentralExportGraphItemObj.dateGen);


  end;
end;



procedure TfrmRQCentralExportGraphItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQCentralExportGraphItem: RQCentralExportGraphItemControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQCentralExportGraphItem := HTTPRIORQCentralExportGraphItem as RQCentralExportGraphItemControllerSoapPort;


     RQCentralExportGraphItemObj.dateGen := GetTXSDateFromTDateTimePicker(edtdateGen);

    if DialogState = dsInsert then
    begin
      RQCentralExportGraphItemObj.code:=low(Integer);
      TempRQCentralExportGraphItem.add(RQCentralExportGraphItemObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQCentralExportGraphItem.save(RQCentralExportGraphItemObj);
    end;
  end;
end;


end.