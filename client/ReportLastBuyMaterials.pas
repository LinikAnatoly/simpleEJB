unit reportLastBuyMaterials;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, Buttons, StdCtrls, ComCtrls ,XSBuiltIns,
  CheckLst, InvokeRegistry, Rio, SOAPHTTPClient;

type
  TfrmreportLastBuyMaterials = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    edtMaterials: TEdit;
    lblMaterial: TLabel;
    chkNotGroupped: TCheckBox;
    lblDateFrom: TLabel;
    lblDateTo: TLabel;
    dtpDateFrom: TDateTimePicker;
    dtpDateTo: TDateTimePicker;
    CheckListBox1: TCheckListBox;
    btnCheckListAll: TSpeedButton;
    btnClearCleckList: TSpeedButton;
    Label1: TLabel;
    Label5: TLabel;
    HTTPRIOTKMaterials: THTTPRIO;
    lblMaterialsGroup: TLabel;
    procedure btnOkClick(Sender: TObject);
    procedure chkNotGrouppedClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCheckListAllClick(Sender: TObject);
    procedure btnClearCleckListClick(Sender: TObject);
    procedure CheckListBox1Click(Sender: TObject);
    procedure edtMaterialsChange(Sender: TObject);
  private
    { Private declarations }
  public
   report_var : Integer;
    { Public declarations }
  end;

var
  frmReportLastBuyMaterials : TfrmreportLastBuyMaterials;
  
implementation

{$R *.dfm}
 uses  ChildFormUnit , EnergyproController , DMReportsUnit, ENConsts, 
  TKMaterialsController;


procedure TfrmreportLastBuyMaterials.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName , strGroupmaterials: String;
  i : Integer;

begin

      SetLength(argNames, 4);
      SetLength(args, 4);

      argNames[0] := 'material';
      args[0] :=  trim(Self.edtMaterials.Text);

      argNames[1] := 'dateFrom';
      args[1] := DateToStr(dtpDateFrom.Date);

      argNames[2] := 'dateTo';
      args[2] := DateToStr(dtpDateTo.Date);

      argNames[3] := 'strGroupmaterials';
      strGroupmaterials:= '';
       /// собираем строку групп материалов
       For i:=0 to CheckListBox1.Count -1  do
        Begin
           if  CheckListBox1.Checked[i] then
            if strGroupmaterials <>  '' then
               strGroupmaterials := strGroupmaterials + ' , ' + IntToStr(  Integer( CheckListBox1.Items.Objects[i] ) )
             else
               strGroupmaterials := strGroupmaterials + IntToStr(  Integer( CheckListBox1.Items.Objects[i] ) ) ;

        End;
       args[3] :=  strGroupmaterials;


      if chkNotGroupped.Checked = False  then
        reportName := 'last_buy_price_for_materials'

      else reportName := 'last_buy_price_for_materials2';

      if length(trim(strGroupmaterials)) > 0 then
      begin
       if dtpDateFrom.Checked = false then
          args[1] := '01.01.1900';
       if dtpDateTo.Checked = false then
          args[2] := '01.01.3000';
       reportName := 'material/material_price_2012';
      end;

      if  report_var =2  then
      reportName := 'material/material_price_min_max';

      

      makeReport(reportName, argNames, args, 'xls')

end;

procedure TfrmreportLastBuyMaterials.chkNotGrouppedClick(Sender: TObject);
begin
  if chkNotGroupped.Checked = True then
  begin
    lblDateFrom.Visible := True;
    lblDateTo.Visible := True;
    dtpDateFrom.Visible := True;
    dtpDateTo.Visible := True;
     DisableControls([dtpDateFrom, dtpDateTo],False);
  end
  else
  begin
    lblDateFrom.Visible := False;
    lblDateTo.Visible := False;
    dtpDateFrom.Visible := False;
    dtpDateTo.Visible := False;
    DisableControls([dtpDateFrom, dtpDateTo]);
    end;

end;

procedure TfrmreportLastBuyMaterials.FormShow(Sender: TObject);
var
TempTKMaterials: TKMaterialsControllerSoapPort;
TKMaterialsList: TKMaterialsShortList;
materialsfilter : TkMaterialsFilter;
i : Integer;
begin
    DisableControls([dtpDateFrom, dtpDateTo]);


     {заполняем группы материалов}
     materialsfilter := TKMaterialsFilter.Create;
     SetNullIntProps(materialsfilter);
     SetNullXSProps(materialsfilter);

     materialsfilter.conditionSQL := 'tk1.parentrefcode is null and tk1.measurementcode is not null';
     materialsfilter.orderBySQL := 'TK1.NAME';


     TempTKMaterials:= HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
     TKMaterialsList := TempTKMaterials.getScrollableFilteredList(materialsfilter,0,-1);
     CheckListBox1.Items.Clear;

    for i:=0 to High(TKMaterialsList.list) do
      begin
        ///////

        CheckListBox1.Items.AddObject(TKMaterialsList.list[i].name , TObject( TKMaterialsList.list[i].code )  );
      end;
end;

procedure TfrmreportLastBuyMaterials.btnCheckListAllClick(Sender: TObject);
var
  I : Integer;
begin


     For i:=0 to CheckListBox1.Count -1  do
    Begin
       if  CheckListBox1.Checked[i] = false then
           CheckListBox1.Checked[i] := true;


    End;

          DisableControls([edtMaterials]);
          edtMaterials.Text:= '';


end;

procedure TfrmreportLastBuyMaterials.btnClearCleckListClick(
  Sender: TObject);
var
  I : Integer;
begin


     For i:=0 to CheckListBox1.Count -1  do
    Begin
       if  CheckListBox1.Checked[i] = True then
           CheckListBox1.Checked[i] := False;

    End;
   
          DisableControls([edtMaterials],false);
end;

procedure TfrmreportLastBuyMaterials.CheckListBox1Click(Sender: TObject);
var
i : integer;
begin
  inherited;
  DisableControls([edtMaterials],false);
   For i:=0 to CheckListBox1.Count -1  do
    Begin
       if  CheckListBox1.Checked[i] = true then
           begin
            DisableControls([edtMaterials]);
            edtMaterials.Text:= '';
            Break;
           end;


    End;
end;

procedure TfrmreportLastBuyMaterials.edtMaterialsChange(Sender: TObject);
begin
  inherited;
    if length(edtMaterials.text) > 0 then
      DisableControls([CheckListBox1])
    else
     DisableControls([CheckListBox1],false) ;

end;

end.
