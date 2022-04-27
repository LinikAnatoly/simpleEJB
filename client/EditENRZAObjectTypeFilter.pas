
unit EditENRZAObjectTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENRZAObjectTypeController ;

type
  TfrmENRZAObjectTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENRZAObjectType: THTTPRIO;

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
  frmENRZAObjectTypeFilterEdit: TfrmENRZAObjectTypeFilterEdit;
  ENRZAObjectTypeFilterObj: ENRZAObjectTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENRZAObjectTypeController  ;
}
{$R *.dfm}



procedure TfrmENRZAObjectTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENRZAObjectTypeObj.name; 


  end;

}

end;



procedure TfrmENRZAObjectTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENRZAObjectType: ENRZAObjectTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENRZAObjectTypeFilterObj.name := edtName.Text; 




  end;
end;




end.