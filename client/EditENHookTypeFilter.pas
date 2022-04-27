
unit EditENHookTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENHookTypeController ;

type
  TfrmENHookTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENHookType: THTTPRIO;

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
  frmENHookTypeFilterEdit: TfrmENHookTypeFilterEdit;
  ENHookTypeFilterObj: ENHookTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENHookTypeController  ;
}
{$R *.dfm}



procedure TfrmENHookTypeFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENHookTypeObj.name; 


  end;

}

end;



procedure TfrmENHookTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENHookType: ENHookTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENHookTypeFilterObj.name := edtName.Text; 




  end;
end;




end.