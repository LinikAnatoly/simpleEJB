
unit EditENResponsibles2FINContracts;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENResponsibles2FINContractsController ;

type
  TfrmENResponsibles2FINContractsEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblFINContracts: TLabel;
    edtFINContracts: TEdit;
    spbFINContracts: TSpeedButton;
  

  HTTPRIOENResponsibles2FINContracts: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    spbENResponsibles: TSpeedButton;
    lblENResponsibles: TLabel;
    edtENResponsibles: TEdit;
    HTTPRIOENResponsibles: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbFINContractsClick(Sender : TObject);
    procedure spbENResponsiblesClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENResponsibles2FINContractsEdit: TfrmENResponsibles2FINContractsEdit;
  ENResponsibles2FINContractsObj: ENResponsibles2FINContracts;

implementation

uses
  ShowFINContracts
  ,FINContractsController
, ENResponsiblesController, ShowENResponsibles;

{uses  
    EnergyproController, EnergyproController2, ENResponsibles2FINContractsController  ;
}
{$R *.dfm}



procedure TfrmENResponsibles2FINContractsEdit.FormShow(Sender: TObject);
var TempENResponsibles: ENResponsiblesControllerSoapPort;
    respObj: ENResponsibles;
begin
  DisableControls([edtCode, edtENResponsibles, edtFINContracts]);

  if DialogState = dsView then
  begin
    DisableControls([spbENResponsibles, spbFINContracts]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtENResponsibles, edtFINContracts]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENResponsibles2FINContractsObj.code);

    if ENResponsibles2FINContractsObj.responsiblesRef <> nil then
    begin
      TempENResponsibles := HTTPRIOENResponsibles as ENResponsiblesControllerSoapPort;
      respObj := TempENResponsibles.getObject(ENResponsibles2FINContractsObj.responsiblesRef.code);
      if respObj <> nil then
        edtENResponsibles.Text := respObj.FIO;
    end;

    if ENResponsibles2FINContractsObj.finContracts <> nil then
    begin
      edtFINContracts.Text := ENResponsibles2FINContractsObj.finContracts.contractNumber;

      if ENResponsibles2FINContractsObj.finContracts.org <> nil then
      begin
        edtFINContracts.Text := ENResponsibles2FINContractsObj.finContracts.contractNumber +
                                ' (' + ENResponsibles2FINContractsObj.finContracts.org.name + ')';
      end;
    end;

  end;
end;



procedure TfrmENResponsibles2FINContractsEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENResponsibles2FINContracts: ENResponsibles2FINContractsControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtENResponsibles, edtFINContracts]) then
  begin
    Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
    Action:=caNone;
  end
  else
  begin
    TempENResponsibles2FINContracts := HTTPRIOENResponsibles2FINContracts as ENResponsibles2FINContractsControllerSoapPort;


    if DialogState = dsInsert then
    begin
      ENResponsibles2FINContractsObj.code:=low(Integer);
      TempENResponsibles2FINContracts.add(ENResponsibles2FINContractsObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENResponsibles2FINContracts.save(ENResponsibles2FINContractsObj);
    end;
  end;
end;


procedure TfrmENResponsibles2FINContractsEdit.spbFINContractsClick(Sender : TObject);
var
   frmFINContractsShow: TfrmFINContractsShow;
begin
   frmFINContractsShow:=TfrmFINContractsShow.Create(Application,fmNormal);
   try
      with frmFINContractsShow do
        if ShowModal = mrOk then
        begin
            try
               if ENResponsibles2FINContractsObj.finContracts = nil then ENResponsibles2FINContractsObj.finContracts := FINContracts.Create();
               ENResponsibles2FINContractsObj.finContracts.code := StrToInt(GetReturnValue(sgFINContracts,0));
               //edtFINContracts.Text:=GetReturnValue(sgFINContracts,1);
               edtFINContracts.Text := GetReturnValue(sgFINContracts, 2) +
                                       ' (' + GetReturnValue(sgFINContracts, 1) + ')';
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINContractsShow.Free;
   end;
end;



procedure TfrmENResponsibles2FINContractsEdit.spbENResponsiblesClick(
  Sender: TObject);
var
   frmENResponsiblesShow: TfrmENResponsiblesShow;
begin
   frmENResponsiblesShow:=TfrmENResponsiblesShow.Create(Application,fmNormal);
   try
      with frmENResponsiblesShow do
        if ShowModal = mrOk then
        begin
            try
               if ENResponsibles2FINContractsObj.responsiblesRef = nil then ENResponsibles2FINContractsObj.responsiblesRef := ENResponsiblesRef.Create();
               ENResponsibles2FINContractsObj.responsiblesRef.code := StrToInt(GetReturnValue(sgENResponsibles,0));
               edtENResponsibles.Text:=GetReturnValue(sgENResponsibles,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENResponsiblesShow.Free;
   end;
end;

end.