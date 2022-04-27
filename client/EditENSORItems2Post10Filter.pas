
unit EditENSORItems2Post10Filter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSORItems2Post10Controller ;

type
  TfrmENSORItems2Post10FilterEdit = class(TDialogForm)



  HTTPRIOENSORItems2Post10: THTTPRIO;

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
  frmENSORItems2Post10FilterEdit: TfrmENSORItems2Post10FilterEdit;
  ENSORItems2Post10FilterObj: ENSORItems2Post10Filter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSORItems2Post10Controller  ;
}
{$R *.dfm}



procedure TfrmENSORItems2Post10FilterEdit.FormShow(Sender: TObject);

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



procedure TfrmENSORItems2Post10FilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENSORItems2Post10: ENSORItems2Post10ControllerSoapPort; //»сключено объ€вление не используемых переменных
begin
  if (ModalResult = mrOk)  then
  begin


  end;
end;




end.