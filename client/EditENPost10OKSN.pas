
unit EditENPost10OKSN;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPost10OKSNController ;

type
  TfrmENPost10OKSNEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
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
    edtPostQuantity: TEdit;
    upDwnPostQuantity: TUpDown;
    chbCopy: TCheckBox;
    edtBranchLineName: TEdit;
    lblBranchLineName: TLabel;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENPostTypePostTtypeClick(Sender : TObject);
    procedure chbCopyClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENPost10OKSNEdit: TfrmENPost10OKSNEdit;
  ENPost10OKSNObj: ENPost10OKSN;

implementation

uses
  ShowENPostType
  ,ENPostTypeController
;

{uses  
    EnergyproController, EnergyproController2, ENPost10OKSNController  ;
}
{$R *.dfm}



procedure TfrmENPost10OKSNEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtENPostTypePostTtypeName
      ,spbENPostTypePostTtype
       ]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtPostNumber
      ,edtNumberOfCables
      ,edtBranchLineName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENPost10OKSNObj.code);
    edtPostNumber.Text := ENPost10OKSNObj.postNumber; 
    if ( ENPost10OKSNObj.numberOfCables <> Low(Integer) ) then
       edtNumberOfCables.Text := IntToStr(ENPost10OKSNObj.numberOfCables)
    else
       edtNumberOfCables.Text := '';

    edtBranchLineName.Text := ENPost10OKSNObj.branchLineName;

    edtENPostTypePostTtypeName.Text := ENPost10OKSNObj.postTtype.name;

  end;
end;



procedure TfrmENPost10OKSNEdit.chbCopyClick(Sender: TObject);
begin
  edtPostQuantity.Visible := chbCopy.Checked;
  upDwnPostQuantity.Visible := chbCopy.Checked;
  if chbCopy.Checked then
    edtPostQuantity.SetFocus;
end;

procedure TfrmENPost10OKSNEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPost10OKSN: ENPost10OKSNControllerSoapPort;
postCnt, i, postNumber: Integer;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtPostNumber
      ,edtNumberOfCables
      ,edtBranchLineName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENPost10OKSN := HTTPRIOENPost10OKSN as ENPost10OKSNControllerSoapPort;


     ENPost10OKSNObj.postNumber := edtPostNumber.Text;

     if ( edtNumberOfCables.Text <> '' ) then
       ENPost10OKSNObj.numberOfCables := StrToInt(edtNumberOfCables.Text)
     else
       ENPost10OKSNObj.numberOfCables := Low(Integer) ;


     ENPost10OKSNObj.branchLineName := edtBranchLineName.Text;

       postCnt := 0;
      if (chbCopy.Checked) and (edtPostQuantity.Text <> '') then
        postCnt := StrToInt(edtPostQuantity.Text);

    if DialogState = dsInsert then
    begin
      if postCnt > 0 then
      begin
         postNumber := 0;
          if edtPostNumber.Text <> '' then
            if IsIntValue(edtPostNumber) then
              postNumber := StrToInt(edtPostNumber.Text);
          for i := 1 to postCnt do
            begin
              if postNumber > 0 then
                ENPost10OKSNObj.postNumber := IntToStr(postNumber);
              if i > 1 then
              ENPost10OKSNObj.code := low(Integer);
              TempENPost10OKSN.add(ENPost10OKSNObj);
              postNumber := postNumber + 1;
            end;
      end
      else

      begin
       ENPost10OKSNObj.code:=low(Integer);
       TempENPost10OKSN.add(ENPost10OKSNObj);
      end;
    end
    else
    if DialogState = dsEdit then
    begin
      TempENPost10OKSN.save(ENPost10OKSNObj);
    end;
  end;
end;


procedure TfrmENPost10OKSNEdit.spbENPostTypePostTtypeClick(Sender : TObject);
var
   frmENPostTypeShow: TfrmENPostTypeShow;
begin
   frmENPostTypeShow:=TfrmENPostTypeShow.Create(Application,fmNormal);
   try
      with frmENPostTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPost10OKSNObj.postTtype = nil then ENPost10OKSNObj.postTtype := ENPostType.Create();
               ENPost10OKSNObj.postTtype.code := StrToInt(GetReturnValue(sgENPostType,0));
               edtENPostTypePostTtypeName.Text:=GetReturnValue(sgENPostType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENPostTypeShow.Free;
   end;
end;



end.