
unit EditFINDoc2MolData;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, FINDoc2MolDataController ;

type
  TfrmFINDoc2MolDataEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblFinDocCode : TLabel;
    edtFinDocCode: TEdit;

  lblFINMolDataMolDataName : TLabel;
  edtFINMolDataMolDataName : TEdit;
  spbFINMolDataMolData : TSpeedButton;
  

  HTTPRIOFINDoc2MolData: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbFINMolDataMolDataClick(Sender : TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmFINDoc2MolDataEdit: TfrmFINDoc2MolDataEdit;
  FINDoc2MolDataObj: FINDoc2MolData;

implementation

uses
  ShowFINMolData
  ,FINMolDataController
;

{uses  
    EnergyproController, EnergyproController2, FINDoc2MolDataController  ;
}
{$R *.dfm}



procedure TfrmFINDoc2MolDataEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtFINMolDataMolDataName
      ,spbFINMolDataMolData
       ]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtFinDocCode
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(FINDoc2MolDataObj.code);
    if ( FINDoc2MolDataObj.finDocCode <> Low(Integer) ) then
       edtFinDocCode.Text := IntToStr(FINDoc2MolDataObj.finDocCode)
    else
       edtFinDocCode.Text := '';

    //edtFINMolDataMolDataName.Text := FINDoc2MolDataObj.molData.name;

  end;
end;



procedure TfrmFINDoc2MolDataEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempFINDoc2MolData: FINDoc2MolDataControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtFinDocCode
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempFINDoc2MolData := HTTPRIOFINDoc2MolData as FINDoc2MolDataControllerSoapPort;


     if ( edtFinDocCode.Text <> '' ) then
       FINDoc2MolDataObj.finDocCode := StrToInt(edtFinDocCode.Text)
     else
       FINDoc2MolDataObj.finDocCode := Low(Integer) ;

    if DialogState = dsInsert then
    begin
      FINDoc2MolDataObj.code:=low(Integer);
      TempFINDoc2MolData.add(FINDoc2MolDataObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempFINDoc2MolData.save(FINDoc2MolDataObj);
    end;
  end;
end;


procedure TfrmFINDoc2MolDataEdit.spbFINMolDataMolDataClick(Sender : TObject);
var 
   frmFINMolDataShow: TfrmFINMolDataShow;
begin
   frmFINMolDataShow:=TfrmFINMolDataShow.Create(Application,fmNormal);
   try
      with frmFINMolDataShow do
        if ShowModal = mrOk then
        begin
            try
               if FINDoc2MolDataObj.molData = nil then FINDoc2MolDataObj.molData := FINMolData.Create();
               FINDoc2MolDataObj.molData.code := StrToInt(GetReturnValue(sgFINMolData,0));
               edtFINMolDataMolDataName.Text:=GetReturnValue(sgFINMolData,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINMolDataShow.Free;
   end;
end;



end.