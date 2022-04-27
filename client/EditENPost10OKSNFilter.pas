
unit EditENPost10OKSNFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPost10OKSNController ;

type
  TfrmENPost10OKSNFilterEdit = class(TDialogForm)

    lblPostNumber : TLabel;
    edtPostNumber: TEdit;

    lblNumberOfCables : TLabel;
    edtNumberOfCables: TEdit;


  lblENPostTypePostTtypeName : TLabel;
  edtENPostTypePostTtypeName : TEdit;
  spbENPostTypePostTtype : TSpeedButton;
  

  HTTPRIOENPost10OKSN: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    spbLine10: TSpeedButton;
    edtLine10: TEdit;
    lblLine10: TLabel;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);

  procedure spbENPostTypePostTtypeClick(Sender : TObject);
    procedure spbLine10Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENPost10OKSNFilterEdit: TfrmENPost10OKSNFilterEdit;
  ENPost10OKSNFilterObj: ENPost10OKSNFilter;

implementation

uses
  ShowENPostType
  ,ENPostTypeController
,  ShowENLine10,  ENLine10Controller;

{uses  
    EnergyproController, EnergyproController2, ENPost10OKSNController  ;
}
{$R *.dfm}



procedure TfrmENPost10OKSNFilterEdit.FormShow(Sender: TObject);

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

    edtPostNumber.Text := ENPost10OKSNObj.postNumber; 



    if ( ENPost10OKSNObj.numberOfCables <> Low(Integer) ) then
       edtNumberOfCables.Text := IntToStr(ENPost10OKSNObj.numberOfCables)
    else
       edtNumberOfCables.Text := '';


  end;

}

end;



procedure TfrmENPost10OKSNFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPost10OKSN: ENPost10OKSNControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENPost10OKSNFilterObj.postNumber := edtPostNumber.Text; 



     if ( edtNumberOfCables.Text <> '' ) then
       ENPost10OKSNFilterObj.numberOfCables := StrToInt(edtNumberOfCables.Text)
     else
       ENPost10OKSNFilterObj.numberOfCables := Low(Integer) ;





  end;
end;

procedure TfrmENPost10OKSNFilterEdit.spbENPostTypePostTtypeClick(Sender : TObject);
var
   frmENPostTypeShow: TfrmENPostTypeShow;
begin
   frmENPostTypeShow:=TfrmENPostTypeShow.Create(Application,fmNormal);
   try
      with frmENPostTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPost10OKSNFilterObj.postTtype = nil then ENPost10OKSNFilterObj.postTtype := ENPostType.Create();
               ENPost10OKSNFilterObj.postTtype.code := StrToInt(GetReturnValue(sgENPostType,0));
               edtENPostTypePostTtypeName.Text:=GetReturnValue(sgENPostType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENPostTypeShow.Free;
   end;
end;





procedure TfrmENPost10OKSNFilterEdit.spbLine10Click(Sender: TObject);
var
   frmENLine10Show: TfrmENLine10Show;
begin
   frmENLine10Show:=TfrmENLine10Show.Create(Application,fmNormal);
   try
      with frmENLine10Show do
        if ShowModal = mrOk then
        begin
            try
               if ENPost10OKSNFilterObj.line10Ref = nil then ENPost10OKSNFilterObj.line10Ref := ENLine10Ref.Create();
               ENPost10OKSNFilterObj.line10Ref.code := StrToInt(GetReturnValue(sgENLine10,0));
               edtLine10.Text:=GetReturnValue(sgENLine10,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENLine10Show.Free;
   end;
end;

end.