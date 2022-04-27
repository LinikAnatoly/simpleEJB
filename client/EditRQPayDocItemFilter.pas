
unit EditRQPayDocItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQPayDocItemController ;

type
  TfrmRQPayDocItemFilterEdit = class(TDialogForm)

    lblSummaGen : TLabel;
    edtSummaGen: TEdit;

    lblCommentGen : TLabel;
    edtCommentGen: TEdit;



  HTTPRIORQPayDocItem: THTTPRIO;

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
  frmRQPayDocItemFilterEdit: TfrmRQPayDocItemFilterEdit;
  RQPayDocItemFilterObj: RQPayDocItemFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQPayDocItemController  ;
}
{$R *.dfm}



procedure TfrmRQPayDocItemFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtSummaGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( RQPayDocItemObj.summaGen <> nil ) then
       edtSummaGen.Text := RQPayDocItemObj.summaGen.decimalString
    else
       edtSummaGen.Text := ''; 



    edtCommentGen.Text := RQPayDocItemObj.commentGen; 


  end;

}

end;



procedure TfrmRQPayDocItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQPayDocItem: RQPayDocItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (RQPayDocItemFilterObj.summaGen = nil ) then
       RQPayDocItemFilterObj.summaGen := TXSDecimal.Create;
     if edtSummaGen.Text <> '' then
       RQPayDocItemFilterObj.summaGen.decimalString := edtSummaGen.Text 
     else
       RQPayDocItemFilterObj.summaGen := nil;




     RQPayDocItemFilterObj.commentGen := edtCommentGen.Text; 




  end;
end;




end.