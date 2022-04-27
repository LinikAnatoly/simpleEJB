
unit EditENTCOValuesFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTCOValuesController ;

type
  TfrmENTCOValuesFilterEdit = class(TDialogForm)

    lblDescription : TLabel;
    edtDescription: TMemo;



  HTTPRIOENTCOValues: THTTPRIO;

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
  frmENTCOValuesFilterEdit: TfrmENTCOValuesFilterEdit;
  ENTCOValuesFilterObj: ENTCOValuesFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENTCOValuesController  ;
}
{$R *.dfm}



procedure TfrmENTCOValuesFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtDescription
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    MakeMultiline(edtDescription.Lines, ENTCOValuesObj.description);


  end;

}

end;



procedure TfrmENTCOValuesFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTCOValues: ENTCOValuesControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENTCOValuesFilterObj.description := edtDescription.Text; 




  end;
end;




end.