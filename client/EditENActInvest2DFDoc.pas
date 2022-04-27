unit EditENActInvest2DFDoc;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENActInvest2DFDocController ;

type
  TfrmENActInvest2DFDocEdit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;
    lblDfDocNumber : TLabel;
    edtDfDocNumber: TEdit;


    HTTPRIOENActInvest2DFDoc: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    chkNecessary: TCheckBox;
    spbDfDoc: TSpeedButton;
    Label1: TLabel;
    edtENACTINVESTTYPE2DFDOC: TEdit;
    spbENACTINVESTTYPE2DFDOC: TSpeedButton;
    Label2: TLabel;
    HTTPRIOENActInvestType2DFDoc: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbDfDocClick(Sender: TObject);
    procedure spbENACTINVESTTYPE2DFDOCClick(Sender: TObject);
    procedure chkNecessaryClick(Sender: TObject);
  

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmENActInvest2DFDocEdit: TfrmENActInvest2DFDocEdit;
  ENActInvest2DFDocObj: ENActInvest2DFDoc;

implementation

uses ShowDocumentManagement, DMReportsUnit, ShowENActInvestType2DFDoc,
  ENActInvestType2DFDocController, ENConsts;



{$R *.dfm}

procedure TfrmENActInvest2DFDocEdit.FormShow(Sender: TObject);
var
 TempENActInvestType2DFDoc: ENActInvestType2DFDocControllerSoapPort;
 ENActInvestType2dfdocObj : ENActInvestType2DFDoc;
begin
  DisableControls([edtCode , edtDfDocNumber  ,  edtENACTINVESTTYPE2DFDOC ]);

  if (DialogState = dsInsert) then
  begin
    HideControls([lblCode, edtCode]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin    
    DenyBlankValues([

    ]);
  end;

  

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    TempENActInvestType2DFDoc := HTTPRIOENActInvestType2DFDoc as ENActInvestType2DFDocControllerSoapPort;
    if ENActInvest2DFDocObj.typeRef.code <> LOW_INT then
    begin
    ENActInvestType2dfdocObj:=  TempENActInvestType2DFDoc.getObject(ENActInvest2DFDocObj.typeRef.code);
    edtENACTINVESTTYPE2DFDOC.Text := ENActInvestType2dfdocObj.name;
    end
    else
     edtENACTINVESTTYPE2DFDOC.Text := '';



    edtCode.Text := IntToStr(ENActInvest2DFDocObj.code);

    edtDfDocNumber.Text := ENActInvest2DFDocObj.dfDocNumber;

      if ENActInvest2DFDocObj.necessary = 0  then
           begin
             chkNecessary.Checked:= true;
             DisableControls([spbDfDoc]);
           end
       else
          begin
           chkNecessary.Checked:= false;
           DisableControls([spbDfDoc],false);
          end


  end;
  if  (DialogState = dsview) then
  begin
     DisableControls([spbENACTINVESTTYPE2DFDOC,spbDfDoc , chkNecessary ]);
  end;
end;



procedure TfrmENActInvest2DFDocEdit.spbDfDocClick(Sender: TObject);
var
  TempEnactInvest2dfdoc :  EnactInvest2dfdocControllerSoapPort;
  frmDFDocManagement: TfrmDocumentManagementShow;
  customerMailData: TArray<String>;

begin
   frmDFDocManagement := TfrmDocumentManagementShow.Create(Application, fmNormal);
              try
                 with frmDFDocManagement do
                begin
                  if ShowModal = mrOk then
                  begin
                    try
                     if (EnactInvest2dfdocObj = nil) then
                     begin
                      EnactInvest2dfdocObj := EnactInvest2dfdoc.Create;
                      SetNullIntProps(EnactInvest2dfdocObj);
                      SetNullXSProps(EnactInvest2dfdocObj);
                     end;


                      EnactInvest2dfdocObj.dfDocCode := StrToInt(GetReturnValue(sgDocumentManagement, 0));
                      EnactInvest2dfdocObj.dfDocTypeCode := StrToInt(GetReturnValue(sgDocumentManagement, 7));
                      EnactInvest2dfdocObj.dfDocNumber := GetReturnValue(sgDocumentManagement, 1);
                      EnactInvest2dfdocObj.dfDocDate := TXSDate.Create;
                      EnactInvest2dfdocObj.dfDocDate.XSToNative(GetXSDate(StrToDate(GetReturnValue(sgDocumentManagement, 2))));
                      EnactInvest2dfdocObj.dfDocDescription := GetReturnValue(sgDocumentManagement, 3);

//                      if Application.MessageBox(PChar('Ви дійсно бажаєте додати зв''язок документа № ' + EnactInvest2dfdocObj.dfDocNumber +
//                                                      ' з актом  ' + DMReports.getENActByCode(EnactInvest2dfdocObj.actRef.code).numberGen + ' ?'),
//                                                PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON1) <> IDOK then
//                        Exit;


                       edtDfDocNumber.Text:= EnactInvest2dfdocObj.dfDocNumber;

                       chkNecessary.Checked:= False;


                    except
                      on EConvertError do Exit;
                    end;
                  end;
                end;
              finally
                frmDFDocManagement.Free;
                frmDFDocManagement := nil;
              end;

end;

procedure TfrmENActInvest2DFDocEdit.spbENACTINVESTTYPE2DFDOCClick(
  Sender: TObject);
var
  TempEnactInvest2dfdoc :  EnactInvest2dfdocControllerSoapPort;
  frmENActInvestType2DFDocShow: TfrmENActInvestType2DFDocShow;

begin
   frmENActInvestType2DFDocShow:=TfrmENActInvestType2DFDocShow.Create(Application,fmNormal);
   try
      with frmENActInvestType2DFDocShow do
        if ShowModal = mrOk then
        begin
            try
             if (EnactInvest2dfdocObj = nil) then
                 begin
                  EnactInvest2dfdocObj := EnactInvest2dfdoc.Create;
                  SetNullIntProps(EnactInvest2dfdocObj);
                  SetNullXSProps(EnactInvest2dfdocObj);
                 end;
                 if(EnactInvest2dfdocObj.typeRef = nil  ) then
                 EnactInvest2dfdocObj.typeRef := ENActInvestType2DFDocRef.Create;
                 EnactInvest2dfdocObj.typeRef.code := StrToInt(GetReturnValue(frmENActInvestType2DFDocShow.sgENActInvestType2DFDoc, 0));

                 edtENACTINVESTTYPE2DFDOC.Text := GetReturnValue(frmENActInvestType2DFDocShow.sgENActInvestType2DFDoc, 1);

            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENActInvestType2DFDocShow.Free;
   end;

end;

procedure TfrmENActInvest2DFDocEdit.chkNecessaryClick(Sender: TObject);
begin
  inherited;
    if chkNecessary.Checked = true  then
    begin
        if EnactInvest2dfdocObj <> nil  then
        begin
          EnactInvest2dfdocObj.dfDocCode:= LOW_INT;
          EnactInvest2dfdocObj.dfDocTypeCode := LOW_INT;
          EnactInvest2dfdocObj.dfDocNumber := '';
          EnactInvest2dfdocObj.dfDocDate := nil;
          EnactInvest2dfdocObj.dfDocDescription:= '';

          edtDfDocNumber.Text := '';
          DisableControls([spbDfDoc]);
        end;
    end
    else
    begin
      DisableControls([spbDfDoc],false);
    end;
end;

procedure TfrmENActInvest2DFDocEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENActInvest2DFDoc: ENActInvest2DFDocControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
          edtENACTINVESTTYPE2DFDOC
     ]) then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Action := caNone;
  end
  else if
   ((edtDfDocNumber.text = '') and ( chkNecessary.Checked = false )  ) then
  begin
    Application.MessageBox(PChar('Оберіть Розпорядження/наказ з DocFlow або активуйте позначку "Розпорядження/Наказ Непотрібно"  !'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Action := caNone;
  end
  else
  begin
    TempENActInvest2DFDoc := HTTPRIOENActInvest2DFDoc as ENActInvest2DFDocControllerSoapPort;



    ENActInvest2DFDocObj.dfDocNumber := edtDfDocNumber.Text;

    if (chkNecessary.Checked) then
      ENActInvest2DFDocObj.necessary := 0
    else
      ENActInvest2DFDocObj.necessary := 1;

    if DialogState = dsInsert then
    begin
      ENActInvest2DFDocObj.code := Low(Integer);
      TempENActInvest2DFDoc.add(ENActInvest2DFDocObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENActInvest2DFDoc.save(ENActInvest2DFDocObj);
    end;
  end;
end;


end.