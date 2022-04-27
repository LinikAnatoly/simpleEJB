
unit EditENActPostingSpecCharactersFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENActPostingSpecCharactersController ;

type
  TfrmENActPostingSpecCharactersFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblCommentGen : TLabel;
    edtCommentGen: TMemo;



  HTTPRIOENActPostingSpecCharacters: THTTPRIO;

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
  frmENActPostingSpecCharactersFilterEdit: TfrmENActPostingSpecCharactersFilterEdit;
  ENActPostingSpecCharactersFilterObj: ENActPostingSpecCharactersFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENActPostingSpecCharactersController  ;
}
{$R *.dfm}



procedure TfrmENActPostingSpecCharactersFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENActPostingSpecCharactersObj.name; 



    MakeMultiline(edtCommentGen.Lines, ENActPostingSpecCharactersObj.commentGen);


  end;

}

end;



procedure TfrmENActPostingSpecCharactersFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENActPostingSpecCharacters: ENActPostingSpecCharactersControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENActPostingSpecCharactersFilterObj.name := edtName.Text; 



     ENActPostingSpecCharactersFilterObj.commentGen := edtCommentGen.Text; 




  end;
end;




end.