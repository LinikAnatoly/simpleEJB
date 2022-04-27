
unit EditENCurrentTransformerTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENCurrentTransformerTypeController ;

type
  TfrmENCurrentTransformerTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENCurrentTransformerType: THTTPRIO;

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
  frmENCurrentTransformerTypeFilterEdit: TfrmENCurrentTransformerTypeFilterEdit;
  ENCurrentTransformerTypeFilterObj: ENCurrentTransformerTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENCurrentTransformerTypeController  ;
}
{$R *.dfm}



procedure TfrmENCurrentTransformerTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENCurrentTransformerTypeObj.name; 


  end;

}

end;



procedure TfrmENCurrentTransformerTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENCurrentTransformerType: ENCurrentTransformerTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENCurrentTransformerTypeFilterObj.name := edtName.Text; 




  end;
end;




end.