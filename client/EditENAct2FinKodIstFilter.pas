
unit EditENAct2FinKodIstFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENAct2FinKodIstController ;

type
  TfrmENAct2FinKodIstFilterEdit = class(TDialogForm)



  HTTPRIOENAct2FinKodIst: THTTPRIO;

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
  frmENAct2FinKodIstFilterEdit: TfrmENAct2FinKodIstFilterEdit;
  ENAct2FinKodIstFilterObj: ENAct2FinKodIstFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENAct2FinKodIstController  ;
}
{$R *.dfm}



procedure TfrmENAct2FinKodIstFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
  end;

}

end;



procedure TfrmENAct2FinKodIstFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENAct2FinKodIst: ENAct2FinKodIstControllerSoapPort; //»сключено объ€вление не используемых переменных
begin
  if (ModalResult = mrOk)  then
  begin


  end;
end;




end.