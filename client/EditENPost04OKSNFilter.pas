
unit EditENPost04OKSNFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPost04OKSNController ;

type
  TfrmENPost04OKSNFilterEdit = class(TDialogForm)

    lblPostNumber : TLabel;
    edtPostNumber: TEdit;

    lblNumberOfCables : TLabel;
    edtNumberOfCables: TEdit;


  lblENPostTypePostTtypeName : TLabel;
  edtENPostTypePostTtypeName : TEdit;
  spbENPostTypePostTtype : TSpeedButton;
  

  HTTPRIOENPost04OKSN: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    spbLine04: TSpeedButton;
    edtLine04: TEdit;
    lblLine10: TLabel;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENPostTypePostTtypeClick(Sender : TObject);
    procedure spbLine04Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENPost04OKSNFilterEdit: TfrmENPost04OKSNFilterEdit;
  ENPost04OKSNFilterObj: ENPost04OKSNFilter;

implementation

uses
  ShowENPostType
  ,ENPostTypeController
, ShowENLine04, ENLine04Controller;

{uses  
    EnergyproController, EnergyproController2, ENPost04OKSNController  ;
}
{$R *.dfm}



procedure TfrmENPost04OKSNFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtPostNumber
      ,edtNumberOfCables
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtPostNumber.Text := ENPost04OKSNObj.postNumber; 



    if ( ENPost04OKSNObj.numberOfCables <> Low(Integer) ) then
       edtNumberOfCables.Text := IntToStr(ENPost04OKSNObj.numberOfCables)
    else
       edtNumberOfCables.Text := '';


  end;

}

end;



procedure TfrmENPost04OKSNFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPost04OKSN: ENPost04OKSNControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENPost04OKSNFilterObj.postNumber := edtPostNumber.Text; 



     if ( edtNumberOfCables.Text <> '' ) then
       ENPost04OKSNFilterObj.numberOfCables := StrToInt(edtNumberOfCables.Text)
     else
       ENPost04OKSNFilterObj.numberOfCables := Low(Integer) ;





  end;
end;

procedure TfrmENPost04OKSNFilterEdit.spbENPostTypePostTtypeClick(Sender : TObject);
var 
   frmENPostTypeShow: TfrmENPostTypeShow;
begin
   frmENPostTypeShow:=TfrmENPostTypeShow.Create(Application,fmNormal);
   try
      with frmENPostTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPost04OKSNFilterObj.postTtype = nil then ENPost04OKSNFilterObj.postTtype := ENPostType.Create();
               ENPost04OKSNFilterObj.postTtype.code := StrToInt(GetReturnValue(sgENPostType,0));
               edtENPostTypePostTtypeName.Text:=GetReturnValue(sgENPostType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENPostTypeShow.Free;
   end;
end;





procedure TfrmENPost04OKSNFilterEdit.spbLine04Click(Sender: TObject);
var
   frmENLine04Show: TfrmENLine04Show;
begin
   frmENLine04Show:=TfrmENLine04Show.Create(Application,fmNormal);
   try
      with frmENLine04Show do
        if ShowModal = mrOk then
        begin
            try
               if ENPost04OKSNFilterObj.line04Ref = nil then ENPost04OKSNFilterObj.line04Ref := ENLine04Ref.Create();
               ENPost04OKSNFilterObj.line04Ref.code := StrToInt(GetReturnValue(sgENLine04,0));
               edtLine04.Text:=GetReturnValue(sgENLine04,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENLine04Show.Free;
   end;
end;

end.