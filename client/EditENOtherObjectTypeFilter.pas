
unit EditENOtherObjectTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENOtherObjectTypeController ;

type
  TfrmENOtherObjectTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENOtherObjectType: THTTPRIO;

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
  frmENOtherObjectTypeFilterEdit: TfrmENOtherObjectTypeFilterEdit;
  ENOtherObjectTypeFilterObj: ENOtherObjectTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENOtherObjectTypeController  ;
}
{$R *.dfm}



procedure TfrmENOtherObjectTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENOtherObjectTypeObj.name; 


  end;

}

end;



procedure TfrmENOtherObjectTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENOtherObjectType: ENOtherObjectTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENOtherObjectTypeFilterObj.name := edtName.Text; 




  end;
end;




end.