
unit EditENBuilderObjectTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENBuilderObjectTypeController ;

type
  TfrmENBuilderObjectTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENBuilderObjectType: THTTPRIO;

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
  frmENBuilderObjectTypeFilterEdit: TfrmENBuilderObjectTypeFilterEdit;
  ENBuilderObjectTypeFilterObj: ENBuilderObjectTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENBuilderObjectTypeController  ;
}
{$R *.dfm}



procedure TfrmENBuilderObjectTypeFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENBuilderObjectTypeObj.name; 


  end;

}

end;



procedure TfrmENBuilderObjectTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENBuilderObjectType: ENBuilderObjectTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENBuilderObjectTypeFilterObj.name := edtName.Text; 




  end;
end;




end.