
unit EditSetFinKodIst;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2 , ENAct2FinKodIstController;

type
  TfrmSetFinKodIstEdit = class(TDialogForm)


  HTTPRIOENAct2FinKodIst: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    spbFinKodIst: TSpeedButton;
    edtFinKodIstName: TEdit;
    lblFinKodIst: TLabel;

  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbFinKodIstClick(Sender: TObject);
  

  private
    { Private declarations }
    FinKodIstCode : Integer;

  public
    { Public declarations }
    ozCode : Integer;

end;

var
  frmSetFinKodIstEdit: TfrmSetFinKodIstEdit;

implementation

uses ShowFinKodIst, FinKodIstController;


{uses  
    EnergyproController, EnergyproController2, SetFinKodIstController  ;
}
{$R *.dfm}



procedure TfrmSetFinKodIstEdit.spbFinKodIstClick(Sender: TObject);
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
               FinKodIstCode := StrToInt(GetReturnValue(sgFinKodIst,0));
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

procedure TfrmSetFinKodIstEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENAct2FinKodIst: ENAct2FinKodIstControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  if not NoBlankValues([  edtFinKodIstName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
  TempENAct2FinKodIst := HTTPRIOENAct2FinKodIst as ENAct2FinKodIstControllerSoapPort;

  TempENAct2FinKodIst.setKodIst4Oz(FinKodIstCode, ozCode);
  end;
end;



end.