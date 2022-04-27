
unit EditENBranch10ItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENBranch10ItemController ;

type
  TfrmENBranch10ItemFilterEdit = class(TDialogForm)


  lblENPostPostName : TLabel;
  edtENPostPostName : TEdit;
  spbENPostPost : TSpeedButton;
  

  HTTPRIOENBranch10Item: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENPostPostClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENBranch10ItemFilterEdit: TfrmENBranch10ItemFilterEdit;
  ENBranch10ItemFilterObj: ENBranch10ItemFilter;

implementation

uses
  ShowENPost
  ,ENPostController
;

{uses  
    EnergyproController, EnergyproController2, ENBranch10ItemController  ;
}
{$R *.dfm}



procedure TfrmENBranch10ItemFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
  end;

}

end;



procedure TfrmENBranch10ItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENBranch10Item: ENBranch10ItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin


  end;
end;

procedure TfrmENBranch10ItemFilterEdit.spbENPostPostClick(Sender : TObject);
var 
   frmENPostShow: TfrmENPostShow;
begin
   frmENPostShow:=TfrmENPostShow.Create(Application,fmNormal);
   try
      with frmENPostShow do
        if ShowModal = mrOk then
        begin
            try
               if ENBranch10ItemFilterObj.post = nil then ENBranch10ItemFilterObj.post := ENPost.Create();
               ENBranch10ItemFilterObj.post.code := StrToInt(GetReturnValue(sgENPost,0));
               edtENPostPostName.Text:=GetReturnValue(sgENPost,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENPostShow.Free;
   end;
end;





end.