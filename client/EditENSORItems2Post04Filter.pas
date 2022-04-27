
unit EditENSORItems2Post04Filter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSORItems2Post04Controller ;

type
  TfrmENSORItems2Post04FilterEdit = class(TDialogForm)



  HTTPRIOENSORItems2Post04: THTTPRIO;

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
  frmENSORItems2Post04FilterEdit: TfrmENSORItems2Post04FilterEdit;
  ENSORItems2Post04FilterObj: ENSORItems2Post04Filter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSORItems2Post04Controller  ;
}
{$R *.dfm}



procedure TfrmENSORItems2Post04FilterEdit.FormShow(Sender: TObject);

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



procedure TfrmENSORItems2Post04FilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENSORItems2Post04: ENSORItems2Post04ControllerSoapPort; //»сключено объ€вление не используемых переменных
begin
  if (ModalResult = mrOk)  then
  begin


  end;
end;




end.