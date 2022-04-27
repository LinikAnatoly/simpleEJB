
unit EditRQFKOrderTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQFKOrderTypeController ;

type
  TfrmRQFKOrderTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblTxtGen : TLabel;
    edtTxtGen: TEdit;



  HTTPRIORQFKOrderType: THTTPRIO;

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
  frmRQFKOrderTypeFilterEdit: TfrmRQFKOrderTypeFilterEdit;
  RQFKOrderTypeFilterObj: RQFKOrderTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQFKOrderTypeController  ;
}
{$R *.dfm}



procedure TfrmRQFKOrderTypeFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtTxtGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := RQFKOrderTypeObj.name; 



    edtTxtGen.Text := RQFKOrderTypeObj.txtGen; 


  end;

}

end;



procedure TfrmRQFKOrderTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQFKOrderType: RQFKOrderTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQFKOrderTypeFilterObj.name := edtName.Text; 



     RQFKOrderTypeFilterObj.txtGen := edtTxtGen.Text; 




  end;
end;




end.