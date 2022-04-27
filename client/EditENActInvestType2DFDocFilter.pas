
unit EditENActInvestType2DFDocFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENActInvestType2DFDocController ;

type
  TfrmENActInvestType2DFDocFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TMemo;



  HTTPRIOENActInvestType2DFDoc: THTTPRIO;

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
  frmENActInvestType2DFDocFilterEdit: TfrmENActInvestType2DFDocFilterEdit;
  ENActInvestType2DFDocFilterObj: ENActInvestType2DFDocFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENActInvestType2DFDocController  ;
}
{$R *.dfm}



procedure TfrmENActInvestType2DFDocFilterEdit.FormShow(Sender: TObject);

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

    MakeMultiline(edtName.Lines, ENActInvestType2DFDocObj.name);


  end;

}

end;



procedure TfrmENActInvestType2DFDocFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENActInvestType2DFDoc: ENActInvestType2DFDocControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENActInvestType2DFDocFilterObj.name := edtName.Text; 




  end;
end;




end.