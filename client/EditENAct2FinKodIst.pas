
unit EditENAct2FinKodIst;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENAct2FinKodIstController ;

type
  TfrmENAct2FinKodIstEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;


  HTTPRIOENAct2FinKodIst: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    spbFinKodIst: TSpeedButton;
    edtFinKodIstName: TEdit;
    lblFinKodIst: TLabel;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbFinKodIstClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENAct2FinKodIstEdit: TfrmENAct2FinKodIstEdit;
  ENAct2FinKodIstObj: ENAct2FinKodIst;

implementation

uses ShowFinKodIst, FinKodIstController;


{uses  
    EnergyproController, EnergyproController2, ENAct2FinKodIstController  ;
}
{$R *.dfm}



procedure TfrmENAct2FinKodIstEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([   edtFinKodIstName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENAct2FinKodIstObj.code);


  end;
end;



procedure TfrmENAct2FinKodIstEdit.spbFinKodIstClick(Sender: TObject);
var
   frmFinKodIstShow: TfrmFinKodIstShow;
   f : FinKodIstFilter;

begin

   frmFinKodIstShow:=TfrmFinKodIstShow.Create(Application,fmNormal);
   try
      with frmFinKodIstShow do begin
        DisableActions([ actEdit, actInsert, actDelete]);
        if ShowModal = mrOk then
        begin
            try
               if ENAct2FinKodIstObj.kodIstRef = nil then
                ENAct2FinKodIstObj.kodIstRef := FinKodIstRef.Create();
               ENAct2FinKodIstObj.kodIstRef.code := StrToInt(GetReturnValue(sgFinKodIst,0));
               edtFinKodIstName.Text:= GetReturnValue(sgFinKodIst,1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFinKodIstShow.Free;
   end;

end;

procedure TfrmENAct2FinKodIstEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENAct2FinKodIst: ENAct2FinKodIstControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([  edtFinKodIstName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENAct2FinKodIst := HTTPRIOENAct2FinKodIst as ENAct2FinKodIstControllerSoapPort;


    if DialogState = dsInsert then
    begin
      ENAct2FinKodIstObj.code:=low(Integer);
      TempENAct2FinKodIst.add(ENAct2FinKodIstObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENAct2FinKodIst.save(ENAct2FinKodIstObj);
    end;
  end;
end;


end.